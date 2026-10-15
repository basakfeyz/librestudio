// Local preview of dist/ that behaves like Netlify for the parts we use: pretty URLs, the headers in
// dist/_headers (including the Content-Security-Policy), 404.html, video range requests, and a stand-in
// for Netlify Forms that accepts POST and logs the field names it received. Run: node preview.mjs [port]

import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { createReadStream } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const DIST = path.join(path.dirname(fileURLToPath(import.meta.url)), 'dist');
const PORT = Number(process.argv[2] || 4321);
const TYPES = {
  '.html': 'text/html; charset=utf-8', '.css': 'text/css; charset=utf-8', '.js': 'text/javascript; charset=utf-8',
  '.svg': 'image/svg+xml', '.webp': 'image/webp', '.jpg': 'image/jpeg', '.png': 'image/png',
  '.woff2': 'font/woff2', '.mp4': 'video/mp4', '.xml': 'application/xml', '.txt': 'text/plain; charset=utf-8',
};

async function siteHeaders() {
  const text = await readFile(path.join(DIST, '_headers'), 'utf8').catch(() => '');
  const rules = [];
  let current = null;
  for (const line of text.split('\n')) {
    if (!line.trim()) continue;
    if (!line.startsWith(' ')) { current = { pattern: line.trim(), headers: {} }; rules.push(current); continue; }
    const i = line.indexOf(':');
    current.headers[line.slice(0, i).trim()] = line.slice(i + 1).trim();
  }
  return rules;
}
const matches = (pattern, url) => (pattern.endsWith('*') ? url.startsWith(pattern.slice(0, -1)) : url === pattern);

async function resolve(urlPath) {
  let p = decodeURIComponent(urlPath.split('?')[0]);
  if (p.endsWith('/')) p += 'index.html';
  let file = path.join(DIST, p);
  if (!file.startsWith(DIST)) return null;
  try {
    const s = await stat(file);
    if (s.isDirectory()) file = path.join(file, 'index.html');
    await stat(file);
    return file;
  } catch { return null; }
}

createServer(async (req, res) => {
  const rules = await siteHeaders();
  const url = req.url.split('?')[0];
  for (const rule of rules) if (matches(rule.pattern, url)) for (const [k, v] of Object.entries(rule.headers)) res.setHeader(k, v);

  if (req.method === 'POST') {
    const chunks = [];
    for await (const c of req) chunks.push(c);
    const body = Buffer.concat(chunks).toString('latin1');
    const names = [...body.matchAll(/name="([^"]+)"/g)].map((m) => m[1]);
    console.log(`[form] POST ${url}: ${names.join(', ')}`);
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    return res.end('ok');
  }

  const file = await resolve(req.url);
  if (!file) {
    res.writeHead(404, { 'Content-Type': TYPES['.html'] });
    return res.end(await readFile(path.join(DIST, '404.html')));
  }
  const type = TYPES[path.extname(file)] || 'application/octet-stream';
  const { size } = await stat(file);
  const range = req.headers.range && /bytes=(\d*)-(\d*)/.exec(req.headers.range);
  if (range) {
    const start = range[1] ? Number(range[1]) : 0;
    const end = range[2] ? Math.min(Number(range[2]), size - 1) : size - 1;
    res.writeHead(206, { 'Content-Type': type, 'Content-Range': `bytes ${start}-${end}/${size}`, 'Accept-Ranges': 'bytes', 'Content-Length': end - start + 1 });
    return createReadStream(file, { start, end }).pipe(res);
  }
  res.writeHead(200, { 'Content-Type': type, 'Content-Length': size, 'Accept-Ranges': 'bytes' });
  createReadStream(file).pipe(res);
}).listen(PORT, () => console.log(`Preview: http://localhost:${PORT}`));
