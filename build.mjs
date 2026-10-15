// Builds the static site for librestudio.co. No dependencies: `node build.mjs`.
// src/pages/**/*.tpl + src/partials/*.tpl  ->  dist/**/index.html, plus assets, _headers, _redirects, sitemap.
// Templates: {{> partial}} includes a partial, {{name}} prints a page or site variable,
// {{current:key}} prints aria-current="page" when the page's "nav" equals key.
// Each page starts with <!--page {...json...} --> holding its title, description, path, lang and nav key.

import { readFile, writeFile, mkdir, readdir, cp, rm, stat } from 'node:fs/promises';
import { execFileSync } from 'node:child_process';
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
  // Google Analytics 4 Measurement ID (G-XXXXXXXXXX). Empty = no analytics, no banner, CSP stays closed.
  // GA loads only after a visitor presses Accept in the consent banner (site.js). Ruling: Başak, 15 Oct 2026.
  ga_id: '',
  clickup_form_url: 'https://forms.clickup.com/9009072703/f/8cfq2hz-15532/7ZKOGCKK691U98W3FE',
};

// Pages that are translations of each other: each gets hreflang links to both (and x-default to English).
const ALTERNATES = [
  { en: '/privacy/', tr: '/kvkk-aday/' },
  { en: '/cookies/', tr: '/cerez-politikasi/' },
];
// IndexNow (Bing, Yandex and the engines that read Bing's index): the key file is published at /<key>.txt and
// netlify/plugins/indexnow pings the sitemap's URLs after each production deploy.
const INDEXNOW_KEY = '76fdde082d3b1c9f159cd54b5bff3696';
// Crawlers we name explicitly so the welcome is on record, search and AI answer engines alike.
const CRAWLERS = ['Googlebot', 'Bingbot', 'Google-Extended', 'GPTBot', 'OAI-SearchBot', 'ChatGPT-User', 'ClaudeBot', 'Claude-SearchBot', 'Claude-User', 'PerplexityBot', 'Perplexity-User', 'Applebot', 'Applebot-Extended', 'DuckDuckBot'];

// ---------------------------------------------------------------- structured data (JSON-LD) and llms.txt
// Rule: say only what the pages visibly say. Wording approved by Başak, 15 Oct 2026.
const STUDIO = {
  description: 'Libre Studio is a remote product design studio for startups. End-to-end UI, UX and product design, design engineering and motion design, made with AI-assisted workflows and a human in the loop. Atomic design foundations let the product, the marketing and the motion scale from one system. Founded by Başak Feyzioğlu. Based in Istanbul, working worldwide.',
  founder: 'Başak Feyzioğlu',
  foundingDate: '2023',
  knowsAbout: ['UI design', 'UX design', 'Product design', 'Design engineering', 'Motion design', 'Design systems', 'Atomic design', 'AI-assisted design', 'AI-enhanced design', 'Claude Code', 'Cursor', 'Figma Make', 'Claude Design', 'Pitch decks', 'Showreels', 'AI imagery', 'Illustration', 'Mascot design', 'SEO', 'Generative engine optimisation (GEO)'],
  // the four service columns on the landing page, as shown there
  services: [
    { name: 'UX & Product Design', items: ['Strategy & concepting', 'UX audit', 'User research', 'A/B testing & heat mapping', 'User journeys', 'User testing'] },
    { name: 'UI Design', items: ['UI audit', 'Website design', 'Web apps', 'Mobile app UI', 'Atomic design systems', 'SaaS & dashboards', 'SEO & GEO'] },
    { name: 'Interaction, AI & No-Code', items: ['No-code development', 'Interaction design', 'Prototyping', 'Developer handoff', 'Design engineering', 'AI design workflows'] },
    { name: 'Product Marketing', items: ['Pitch deck', 'Sales deck', 'Showreel', 'Product explanation video', 'Presentation design', 'Motion video', 'Motion design', 'AI imagery & illustration', 'Mascot design'] },
  ],
  // the four cards in Projects; role ruled by Başak: end-to-end UI/UX design. The apps are clients' products,
  // so they are plain Things with their App Store link, not SoftwareApplication (that would claim we sell them).
  projects: [
    { name: 'Lula: AI Bedtime Stories', tag: 'A new story, every night.', role: 'End-to-end UI/UX design', url: '/work/lula/', about: { '@type': 'Thing', name: 'Lula: AI Bedtime Stories', url: 'https://apps.apple.com/tr/app/lula-ai-bedtime-stories/id6775413640' } },
    { name: 'MONA AI: Photo & Video Studio', tag: 'Your face, 500+ styles.', role: 'End-to-end UI/UX design and motion', url: '/work/mona-ai/', about: { '@type': 'Thing', name: 'MONA AI: Photo & Video Studio', url: 'https://apps.apple.com/tr/app/mona-ai-photo-video-studio/id6761020447' } },
    { name: 'Tales AI landing page', tag: 'A CRO-focused waitlist page illustrated with Nano Banana, built in Next.js.', role: 'Landing page design and front-end build', url: '/work/tales-ai-landing/', about: { '@type': 'Thing', name: 'tales-ai-landingpage on GitHub', url: 'https://github.com/basakfeyz/tales-ai-landingpage' } },
    { name: 'Libre Studio website', tag: 'Designed, built and set up for SEO and GEO.', role: 'Website design, build, SEO and GEO', url: '/work/librestudio-website/' },
    { name: 'Echopod UX Audit', tag: 'The full audit, walked through.', role: 'UX audit', url: '/work/echopod-ux-audit/' },
    { name: 'Echopod Design System', tag: 'One source of truth for mobile & web apps.', role: 'Design system' },
  ],
  reel: { name: 'Libre Studio showreel', description: 'The Libre Studio showreel: UX and product design, UI design, interaction, AI and no-code, and product marketing work for startups.', duration: 'PT1M24S', uploadDate: '2026-10-15T00:00:00+03:00', contentUrl: '/assets/video/showreel-1080.mp4', thumbnailUrl: '/assets/video/showreel-loop-poster.webp' },
};

const decode = (t) => t.replace(/<[^>]+>/g, '').replace(/&amp;/g, '&').replace(/&nbsp;/g, ' ').replace(/&#39;|&rsquo;/g, "'").replace(/&quot;/g, '"').replace(/\s+/g, ' ').trim();

// Q&A pairs read back from the built page, so the markup always equals the visible FAQ
function faqFrom(html) {
  return [...html.matchAll(/<details class="faq__item"[\s\S]*?<summary[^>]*>([\s\S]*?)<\/summary>[\s\S]*?data-accordion-body>([\s\S]*?)<\/details>/g)]
    .map(([, q, a]) => ({ q: decode(q), a: decode(a) }));
}

function jsonLd(meta, vars, html) {
  const O = SITE.origin;
  const org = {
    '@type': 'Organization', '@id': `${O}/#organization`, name: 'Libre Studio', url: `${O}/`,
    logo: { '@type': 'ImageObject', url: `${O}/assets/img/apple-touch-icon.png`, width: 180, height: 180 },
    image: `${O}/assets/img/og.jpg`, email: SITE.email, description: STUDIO.description, foundingDate: STUDIO.foundingDate,
    founder: { '@type': 'Person', '@id': `${O}/#founder`, name: STUDIO.founder, jobTitle: 'Founder and product designer', url: `${O}/about/`, sameAs: ['https://www.linkedin.com/in/basakfeyzioglu/', 'https://www.upwork.com/freelancers/basakf'], alumniOf: { '@type': 'CollegeOrUniversity', name: 'Koç University' } },
    address: { '@type': 'PostalAddress', addressLocality: 'Istanbul', addressCountry: 'TR' },
    areaServed: 'Worldwide', knowsAbout: STUDIO.knowsAbout,
  };
  const graph = [
    org,
    { '@type': 'WebSite', '@id': `${O}/#website`, name: 'Libre Studio', url: `${O}/`, publisher: { '@id': `${O}/#organization` }, inLanguage: 'en' },
    { '@type': 'WebPage', '@id': vars.canonical, url: vars.canonical, name: meta.title, description: meta.description, isPartOf: { '@id': `${O}/#website` }, about: { '@id': `${O}/#organization` }, inLanguage: vars.lang },
  ];
  if (meta.path === '/') {
    org.hasOfferCatalog = {
      '@type': 'OfferCatalog', name: 'AI-enhanced design services',
      itemListElement: STUDIO.services.map((sv) => ({ '@type': 'OfferCatalog', name: sv.name, itemListElement: sv.items.map((name) => ({ '@type': 'Offer', itemOffered: { '@type': 'Service', name, provider: { '@id': `${O}/#organization` } } })) })),
    };
    graph.push({ '@type': 'VideoObject', '@id': `${O}/#showreel`, name: STUDIO.reel.name, description: STUDIO.reel.description, duration: STUDIO.reel.duration, uploadDate: STUDIO.reel.uploadDate, contentUrl: O + STUDIO.reel.contentUrl, thumbnailUrl: O + STUDIO.reel.thumbnailUrl, publisher: { '@id': `${O}/#organization` } });
    graph.push({
      '@type': 'ItemList', '@id': `${O}/#projects`, name: 'Projects',
      itemListElement: STUDIO.projects.map((pr, i) => ({ '@type': 'ListItem', position: i + 1, item: { '@type': 'CreativeWork', name: pr.name, description: `${pr.role} by Libre Studio. ${pr.tag}`, creator: { '@id': `${O}/#organization` }, ...(pr.url ? { url: pr.url.startsWith('/') ? O + pr.url : pr.url } : {}), ...(pr.about ? { about: pr.about } : {}) } })),
    });
  }
  const faq = faqFrom(html);
  if (faq.length) graph.push({ '@type': 'FAQPage', '@id': `${vars.canonical}#faq`, mainEntity: faq.map(({ q, a }) => ({ '@type': 'Question', name: q, acceptedAnswer: { '@type': 'Answer', text: a } })) });
  return `<script type="application/ld+json">${JSON.stringify({ '@context': 'https://schema.org', '@graph': graph }).replace(/</g, '\\u003c')}</script>`;
}

function llmsTxt(pages) {
  const line = (p) => `- [${p.title.replace(/ · Libre Studio$/, '')}](${SITE.origin}${p.path}): ${p.description}`;
  const LEGAL = ['/privacy/', '/kvkk-aday/', '/acik-riza/', '/kvkk-basvuru/', '/cookies/', '/cerez-politikasi/'];
  const main = pages.filter((p) => !LEGAL.includes(p.path));
  const legal = pages.filter((p) => !main.includes(p));
  return `# Libre Studio

> ${STUDIO.description}

Libre Studio designs and builds web apps, mobile apps, websites and atomic design systems for startups, and the launch material around them: pitch decks, showreels and product videos. AI is used every day, with a designer in charge of every decision; the studio works in Claude Code, Cursor, Claude Design and Figma Make, on atomic design foundations, so the UI, the marketing pages, the motion and the showreels grow from one system.

Services: ${STUDIO.services.map((sv) => `${sv.name} (${sv.items.join(', ')})`).join('; ')}.

Projects: ${STUDIO.projects.map((pr) => `${pr.name}, ${(/^[A-Z][a-z]/.test(pr.role) ? pr.role.charAt(0).toLowerCase() + pr.role.slice(1) : pr.role)}${pr.url ? ` (${pr.url.startsWith('/') ? SITE.origin + pr.url : pr.url})` : pr.about ? ` (${pr.about.url})` : ''}`).join('; ')}.

Contact: ${SITE.email}. Book a call: ${SITE.calendar}

## Pages

${main.map(line).join('\n')}

## Optional

${legal.map(line).join('\n')}
`;
}

const FORM_ORIGIN = 'https://forms.clickup.com';
if (SITE.clickup_form_url && !SITE.clickup_form_url.startsWith(FORM_ORIGIN + '/')) throw new Error('clickup_form_url must start with ' + FORM_ORIGIN);
const esc = (s) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;');
// The form is linked, never embedded: ClickUp's form page loads Google, PartnerStack, Segment and Datadog trackers
// (measured 15 Oct 2026), and embedding it would make this site load them (KVKK Kurul 2023/1645). Ruling: Başak, 15 Oct 2026.
const APPLY_FORM = SITE.clickup_form_url
  ? `<div class="apply__form apply__gate" data-reveal>
        <div class="apply__gate-inner">
          <p class="h5">The form opens on ClickUp</p>
          <p>Our application form is hosted by ClickUp and opens on their site in a new tab. ClickUp and the services it works with may set their own cookies there, under ClickUp's policies. This site sets none unless you accept analytics. Details: <a class="text-link" href="/cookies/">Cookie Notice</a> · <a class="text-link" href="/cerez-politikasi/" lang="tr">Çerez Aydınlatma Metni</a>.</p>
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

const GA = /^G-[A-Z0-9]{6,12}$/.test(SITE.ga_id) ? SITE.ga_id : '';
if (SITE.ga_id && !GA) throw new Error('ga_id must look like G-XXXXXXXXXX');
const GA_META = GA ? `<meta name="ga-id" content="${GA}">` : '';
const CONSENT_TEXT = {
  en: { label: 'Cookie consent', text: 'With your consent, we use Google Analytics (Google LLC, USA) to see which pages help people. It sets cookies and sends usage data to the USA. Nothing loads until you choose.', notice: '<a class="text-link" href="/cookies/">Cookie Notice</a>', decline: 'Decline', accept: 'Accept', settings: 'Cookie settings' },
  tr: { label: 'Çerez onayı', text: 'Açık rızanızla, hangi sayfaların işe yaradığını görmek için Google Analytics (Google LLC, ABD) kullanırız. Çerez yazar ve kullanım verilerini ABD\'ye aktarır. Siz seçim yapana kadar hiçbir şey yüklenmez.', notice: '<a class="text-link" href="/cerez-politikasi/">Çerez Aydınlatma Metni</a>', decline: 'Reddet', accept: 'Kabul et', settings: 'Çerez ayarları' },
};
const consentBanner = (lang) => {
  if (!GA) return '';
  const t = CONSENT_TEXT[lang] || CONSENT_TEXT.en;
  return `<div class="consent" role="region" aria-label="${t.label}" lang="${lang === 'tr' ? 'tr' : 'en'}" data-consent hidden>
  <div class="consent__inner">
    <p class="consent__text">${t.text} ${t.notice}</p>
    <div class="consent__actions">
      <button type="button" class="btn btn--lime btn--sm" data-consent-choice="denied"><span class="btn__label"><span data-text="${t.decline}">${t.decline}</span></span></button>
      <button type="button" class="btn btn--lime btn--sm" data-consent-choice="granted"><span class="btn__label"><span data-text="${t.accept}">${t.accept}</span></span></button>
    </div>
  </div>
</div>`;
};
const cookieSettings = (lang) => (GA ? `<button type="button" class="footer__cookie-btn" lang="${lang === 'tr' ? 'tr' : 'en'}" data-consent-open>${(CONSENT_TEXT[lang] || CONSENT_TEXT.en).settings}</button>` : '');

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

function hreflang(pagePath) {
  const pair = ALTERNATES.find((a) => a.en === pagePath || a.tr === pagePath);
  if (!pair) return '';
  return [
    `<link rel="alternate" hreflang="en" href="${SITE.origin}${pair.en}">`,
    `<link rel="alternate" hreflang="tr" href="${SITE.origin}${pair.tr}">`,
    `<link rel="alternate" hreflang="x-default" href="${SITE.origin}${pair.en}">`,
  ].join('\n');
}

// Last change to a page's source, from git when the history is there (Netlify clones it), else the file date.
async function lastmod(file) {
  try {
    const out = execFileSync('git', ['log', '-1', '--format=%cs', '--', file], { cwd: ROOT, stdio: ['ignore', 'pipe', 'ignore'] }).toString().trim();
    if (out) return out;
  } catch {}
  return (await stat(file)).mtime.toISOString().slice(0, 10);
}

// Every internal link, image, video and anchor in the built pages must point at something that exists.
async function checkLinks(built, redirects) {
  const ids = new Map(built.map(({ urlPath, html }) => [urlPath, new Set([...html.matchAll(/\sid="([^"]+)"/g)].map((m) => m[1]))]));
  const problems = [];
  for (const { urlPath, html } of built) {
    for (const [, attr, raw] of html.matchAll(/\s(href|src|poster|srcset)="([^"]+)"/g)) {
      for (const ref of attr === 'srcset' ? raw.split(',').map((s) => s.trim().split(/\s+/)[0]) : [raw]) {
        if (/^(https?:|mailto:|tel:|data:|\/\/)/.test(ref)) continue;
        const [pathPart, hash] = ref.split('#');
        const target = pathPart === '' ? urlPath : pathPart.split('?')[0];
        if (!target.startsWith('/')) { problems.push(`${urlPath}: relative link ${ref}`); continue; }
        if (redirects.has(target)) continue;
        if (target.endsWith('/')) {
          if (!ids.has(target)) { problems.push(`${urlPath}: no page at ${ref}`); continue; }
          if (hash && !ids.get(target).has(hash)) problems.push(`${urlPath}: no #${hash} on ${target}`);
        } else {
          try { await stat(path.join(OUT, target)); } catch { problems.push(`${urlPath}: missing file ${ref}`); }
        }
      }
    }
  }
  if (problems.length) throw new Error('Broken internal links:\n  ' + problems.join('\n  '));
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
  const built = [];
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
      ga_meta: GA_META,
      consent_banner: consentBanner(meta.lang || 'en'),
      cookie_settings: cookieSettings(meta.lang || 'en'),
      lang: meta.lang || 'en',
      title: meta.title,
      description: meta.description,
      path: meta.path,
      canonical: SITE.origin + meta.path,
      nav: meta.nav || '',
      robots: meta.noindex ? '<meta name="robots" content="noindex">' : '',
      hreflang: hreflang(meta.path),
    };
    let html = render(body, vars, partials);
    if (!meta.noindex && meta.title.length > 65) console.warn(`  title ${meta.title.length} chars (Google shows ~60): ${meta.path}`);
    if (!meta.noindex && (meta.description.length > 160 || meta.description.length < 70)) console.warn(`  description ${meta.description.length} chars (aim 70 to 160): ${meta.path}`);
    if (/\{\{|\}\}/.test(html)) throw new Error(`Unrendered template tag left in ${file}`);
    if (!meta.noindex) html = html.replace('</head>', `${jsonLd(meta, vars, html)}\n</head>`);
    if (/[–—]/.test(html.replace(/<!--[\s\S]*?-->/g, ''))) throw new Error(`En or em dash found in ${file}: site copy uses periods and commas instead`);

    const rel = path.relative(path.join(SRC, 'pages'), file);
    const outFile = rel === '404.tpl' ? path.join(OUT, '404.html') : path.join(OUT, rel.replace(/\.tpl$/, '.html'));
    await mkdir(path.dirname(outFile), { recursive: true });
    await writeFile(outFile, html);
    built.push({ urlPath: rel === '404.tpl' ? '/404.html' : meta.path, html });
    if (!meta.noindex) sitemap.push({ loc: SITE.origin + meta.path, lastmod: await lastmod(file), title: meta.title, description: meta.description, path: meta.path });
  }

  const scriptHash = sha(EARLY_JS, 'sha256', 'base64');
  const csp = [
    "default-src 'self'",
    `script-src 'self' 'sha256-${scriptHash}'${GA ? ' https://www.googletagmanager.com' : ''}`,
    "style-src 'self'",
    `img-src 'self' data:${GA ? ' https://*.google-analytics.com https://*.googletagmanager.com' : ''}`,
    "media-src 'self'",
    "font-src 'self'",
    `connect-src 'self'${GA ? ' https://*.google-analytics.com https://*.analytics.google.com https://*.googletagmanager.com' : ''}`,
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

  const REDIRECTS = `/apply        /careers/apply/  301
/culture      /careers/        301
/join         /careers/        301
/kvkk         /kvkk-aday/      301
/aydinlatma   /kvkk-aday/      301
/privacy-policy  /privacy/     301
/cerez        /cerez-politikasi/  301
/cookie-policy  /cookies/      301
/basvuru      /kvkk-basvuru/   301
/consent      /acik-riza/#en   301
`;
  await writeFile(path.join(OUT, '_redirects'), REDIRECTS);
  await checkLinks(built, new Set(REDIRECTS.trim().split('\n').map((l) => l.split(/\s+/)[0])));

  const robots = [...CRAWLERS.map((ua) => `User-agent: ${ua}\nAllow: /\n`), 'User-agent: *\nAllow: /\n', `Sitemap: ${SITE.origin}/sitemap.xml\n`].join('\n');
  await writeFile(path.join(OUT, 'robots.txt'), robots);
  await writeFile(path.join(OUT, `${INDEXNOW_KEY}.txt`), INDEXNOW_KEY);
  await writeFile(path.join(OUT, 'llms.txt'), llmsTxt([...sitemap].sort((a, b) => a.path.localeCompare(b.path))));
  const xmlPages = sitemap.sort((a, b) => a.loc.localeCompare(b.loc)).map((u) => {
    const pair = ALTERNATES.find((a) => SITE.origin + a.en === u.loc || SITE.origin + a.tr === u.loc);
    const alt = pair ? `\n    <xhtml:link rel="alternate" hreflang="en" href="${SITE.origin}${pair.en}"/>\n    <xhtml:link rel="alternate" hreflang="tr" href="${SITE.origin}${pair.tr}"/>` : '';
    return `  <url>\n    <loc>${u.loc}</loc>\n    <lastmod>${u.lastmod}</lastmod>${alt}\n  </url>`;
  });
  await writeFile(path.join(OUT, 'sitemap.xml'), `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">\n${xmlPages.join('\n')}\n</urlset>\n`);

  console.log(`Built ${pages.length} pages into dist/ (css ${versions.css_v}, js ${versions.js_v})`);
}

main().catch((err) => { console.error(err.message); process.exit(1); });
