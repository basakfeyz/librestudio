// Builds the static site for librestudio.co. No dependencies: `node build.mjs`.
// src/pages/**/*.tpl + src/partials/*.tpl  ->  dist/**/index.html, plus assets, _headers, _redirects, sitemap.
// Templates: {{> partial}} includes a partial, {{name}} prints a page or site variable,
// {{current:key}} prints aria-current="page" when the page's "nav" equals key.
// Each page starts with <!--page {...json...} --> holding its title, description, path, lang and nav key.

import { readFile, writeFile, mkdir, readdir, cp, rm } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.dirname(fileURLToPath(import.meta.url));
const SRC = path.join(ROOT, 'src');
const OUT = path.join(ROOT, 'dist');

const SITE = {
  origin: 'https://librestudio.co',
  email: 'basak@librestudio.co',
  calendar: 'https://calendar.app.google/YzPyCHRCMTTBD3Yf6',
  year: String(new Date().getFullYear()),
  notice_version: '2026-10-15',
  // Public share link of the ClickUp application form (forms.clickup.com/...). Empty = placeholder on /careers/apply/.
  clickup_form_url: 'https://forms.clickup.com/9009072703/f/8cfq2hz-15532/7ZKOGCKK691U98W3FE',
};

const FORM_ORIGIN = 'https://forms.clickup.com';
if (SITE.clickup_form_url && !SITE.clickup_form_url.startsWith(FORM_ORIGIN + '/')) throw new Error('clickup_form_url must start with ' + FORM_ORIGIN);
const esc = (s) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;');
// The form is linked, never embedded: ClickUp's form page loads Google, PartnerStack, Segment and Datadog trackers
// (measured 15 Oct 2026), and embedding it would make this site load them (KVKK Kurul 2023/1645). Ruling: Başak, 15 Oct 2026.
const APPLY_FORM = SITE.clickup_form_url
  ? `<div class="apply__form apply__gate" data-reveal>
        <div class="apply__gate-inner">
          <p class="h5">The form opens on ClickUp</p>
          <p>Our application form is hosted by ClickUp and opens on their site in a new tab. ClickUp and the services it works with may set their own cookies there, under ClickUp's policies. This site sets none. Details: <a class="text-link" href="/cookies/">Cookie Notice</a> · <a class="text-link" href="/cerez-politikasi/" lang="tr">Çerez Aydınlatma Metni</a>.</p>
          <div class="apply__gate-actions">
            <a class="btn btn--lime" href="${esc(SITE.clickup_form_url)}" target="_blank" rel="noopener">Open the application form</a>
          </div>
          <p class="text-sm apply__fallback">Rather not use ClickUp? Email your portfolio link and a few lines about yourself to <a class="text-link" href="mailto:${SITE.email}">${SITE.email}</a>. It counts as the same application.</p>
        </div>
      </div>`
  : `<div class="apply__form apply__form--soon" data-reveal>
        <p class="h5">The application form opens here soon.</p>
        <p>Until then, send your portfolio link to <a class="text-link" href="mailto:${SITE.email}">${SITE.email}</a>.</p>
      </div>`;

// The one inline script: adds .js before first paint, and removes it again if site.js never arrives.
const EARLY_JS = "document.documentElement.classList.add('js');setTimeout(function(){if(!window.siteReady)document.documentElement.classList.remove('js')},2500);";

const sha = (buf, alg = 'sha256', enc = 'hex') => createHash(alg).update(buf).digest(enc);

async function walk(dir) {
  const out = [];
  for (const entry of await readdir(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) out.push(...(await walk(full)));
    else out.push(full);
  }
  return out;
}

function render(tpl, vars, partials, depth = 0) {
  if (depth > 5) throw new Error('Partials nested too deep');
  let html = tpl.replace(/\{\{>\s*([\w-]+)\s*\}\}/g, (_, name) => {
    if (!(name in partials)) throw new Error(`Missing partial: ${name}`);
    return render(partials[name], vars, partials, depth + 1);
  });
  html = html.replace(/\{\{current:([\w-]+)\}\}/g, (_, key) => (vars.nav === key ? ' aria-current="page"' : ''));
  html = html.replace(/\{\{([\w-]+)\}\}/g, (_, key) => {
    if (!(key in vars)) throw new Error(`Missing variable: ${key}`);
    return vars[key];
  });
  return html;
}

async function main() {
  await rm(OUT, { recursive: true, force: true });
  await mkdir(OUT, { recursive: true });
  await cp(path.join(SRC, 'assets'), path.join(OUT, 'assets'), { recursive: true });

  const partials = {};
  for (const file of await readdir(path.join(SRC, 'partials'))) {
    if (file.endsWith('.tpl')) partials[file.slice(0, -4)] = await readFile(path.join(SRC, 'partials', file), 'utf8');
  }

  const versions = {
    css_v: sha(await readFile(path.join(SRC, 'assets/css/site.css'))).slice(0, 10),
    js_v: sha(await readFile(path.join(SRC, 'assets/js/site.js'))).slice(0, 10),
  };

  const pages = (await walk(path.join(SRC, 'pages'))).filter((f) => f.endsWith('.tpl'));
  const sitemap = [];
  for (const file of pages) {
    const raw = await readFile(file, 'utf8');
    const match = raw.match(/^<!--page\s+(\{[\s\S]*?\})\s*-->\n?/);
    if (!match) throw new Error(`No <!--page {...} --> header in ${file}`);
    const meta = JSON.parse(match[1]);
    const body = raw.slice(match[0].length);
    const vars = {
      ...SITE,
      ...versions,
      early_js: EARLY_JS,
      apply_form: APPLY_FORM,
      lang: meta.lang || 'en',
      title: meta.title,
      description: meta.description,
      path: meta.path,
      canonical: SITE.origin + meta.path,
      nav: meta.nav || '',
      robots: meta.noindex ? '<meta name="robots" content="noindex">' : '',
    };
    const html = render(body, vars, partials);
    if (/\{\{|\}\}/.test(html)) throw new Error(`Unrendered template tag left in ${file}`);
    if (/[–—]/.test(html.replace(/<!--[\s\S]*?-->/g, ''))) throw new Error(`En or em dash found in ${file}: site copy uses periods and commas instead`);

    const rel = path.relative(path.join(SRC, 'pages'), file);
    const outFile = rel === '404.tpl' ? path.join(OUT, '404.html') : path.join(OUT, rel.replace(/\.tpl$/, '.html'));
    await mkdir(path.dirname(outFile), { recursive: true });
    await writeFile(outFile, html);
    if (!meta.noindex) sitemap.push(SITE.origin + meta.path);
  }

  const scriptHash = sha(EARLY_JS, 'sha256', 'base64');
  const csp = [
    "default-src 'self'",
    `script-src 'self' 'sha256-${scriptHash}'`,
    "style-src 'self'",
    "img-src 'self' data:",
    "media-src 'self'",
    "font-src 'self'",
    "connect-src 'self'",
    "frame-src 'none'",
    "form-action 'self'",
    "frame-ancestors 'none'",
    "base-uri 'self'",
    "object-src 'none'",
  ].join('; ');

  await writeFile(path.join(OUT, '_headers'), `/*
  Content-Security-Policy: ${csp}
  X-Content-Type-Options: nosniff
  X-Frame-Options: DENY
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=(), browsing-topics=()
/assets/css/*
  Cache-Control: public, max-age=31536000, immutable
/assets/js/*
  Cache-Control: public, max-age=31536000, immutable
/assets/fonts/*
  Cache-Control: public, max-age=31536000, immutable
/assets/video/*
  Cache-Control: public, max-age=2592000
/assets/img/*
  Cache-Control: public, max-age=604800
`);

  await writeFile(path.join(OUT, '_redirects'), `/apply        /careers/apply/  301
/culture      /careers/        301
/join         /careers/        301
/kvkk         /kvkk-aday/      301
/aydinlatma   /kvkk-aday/      301
/privacy-policy  /privacy/     301
/cerez        /cerez-politikasi/  301
/cookie-policy  /cookies/      301
/basvuru      /kvkk-basvuru/   301
/consent      /acik-riza/#en   301
`);

  await writeFile(path.join(OUT, 'robots.txt'), `User-agent: *\nAllow: /\n\nSitemap: ${SITE.origin}/sitemap.xml\n`);
  await writeFile(path.join(OUT, 'sitemap.xml'), `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${sitemap.sort().map((u) => `  <url><loc>${u}</loc></url>`).join('\n')}\n</urlset>\n`);

  console.log(`Built ${pages.length} pages into dist/ (css ${versions.css_v}, js ${versions.js_v})`);
}

main().catch((err) => { console.error(err.message); process.exit(1); });
