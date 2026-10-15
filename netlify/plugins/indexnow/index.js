// After a production deploy is live, tell IndexNow (Bing and the engines that share its index) which URLs exist.
// No dependencies. A failed ping never fails the deploy.
import { readFile } from 'node:fs/promises';
import path from 'node:path';

export const onSuccess = async ({ constants }) => {
  if (process.env.CONTEXT !== 'production') return;
  try {
    const dist = constants.PUBLISH_DIR;
    const sitemap = await readFile(path.join(dist, 'sitemap.xml'), 'utf8');
    const urlList = [...sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1]);
    const keyFile = (await import('node:fs')).readdirSync(dist).find((f) => /^[0-9a-f]{32}\.txt$/.test(f));
    if (!keyFile || !urlList.length) return console.log('IndexNow: no key file or sitemap, skipped');
    const host = new URL(urlList[0]).host;
    const key = keyFile.slice(0, -4);
    const res = await fetch('https://api.indexnow.org/indexnow', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=utf-8' },
      body: JSON.stringify({ host, key, keyLocation: `https://${host}/${keyFile}`, urlList }),
    });
    console.log(`IndexNow: ${urlList.length} URLs, HTTP ${res.status}`);
  } catch (err) {
    console.log(`IndexNow: ping failed (${err.message}), deploy unaffected`);
  }
};
