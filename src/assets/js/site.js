/* librestudio.co: progressive enhancement only. Every page works without this file. */
(() => {
  const root = document.documentElement;
  root.classList.add('js');
  window.siteReady = true;

  const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)');
  const saveData = navigator.connection && navigator.connection.saveData;

  /* ---------------------------------------------------------------- headlines: split into words for the mask rise */
  function splitWords(el) {
    const label = el.textContent.replace(/\s+/g, ' ').trim();
    let i = 0;
    const wrap = (node) => {
      const w = document.createElement('span');
      w.className = 'w';
      w.setAttribute('aria-hidden', 'true');
      const inner = document.createElement('span');
      inner.style.setProperty('--i', i++);
      inner.appendChild(node);
      w.appendChild(inner);
      return w;
    };
    [...el.childNodes].forEach((node) => {
      if (node.nodeType === Node.TEXT_NODE) {
        const frag = document.createDocumentFragment();
        node.textContent.split(/(\s+)/).forEach((part) => {
          if (!part) return;
          if (/^\s+$/.test(part)) frag.appendChild(document.createTextNode(' '));
          else frag.appendChild(wrap(document.createTextNode(part)));
        });
        node.replaceWith(frag);
      } else if (node.nodeType === Node.ELEMENT_NODE) {
        const placeholder = document.createComment('');
        node.replaceWith(placeholder);
        placeholder.replaceWith(wrap(node));
      }
    });
    el.setAttribute('aria-label', label);
    return i;
  }

  /* ---------------------------------------------------------------- hand-drawn strokes: measure each path */
  function prepareDraw(svg) {
    svg.querySelectorAll('path').forEach((p, idx) => {
      const len = Math.ceil(p.getTotalLength ? p.getTotalLength() : 1000) + 2;
      p.style.setProperty('--len', len);
      const order = Number(p.getAttribute('data-order') ?? idx);
      const step = Number(svg.dataset.drawStep || 0);
      p.style.setProperty('--d', order * step);
    });
  }

  const words = new Map();
  document.querySelectorAll('[data-split]').forEach((el) => words.set(el, splitWords(el)));
  document.querySelectorAll('[data-draw]').forEach(prepareDraw);
  // Chrome can keep painting a marked word with the fallback font's glyphs after the webfont arrives,
  // when nothing animates it (reduced motion): nudge a repaint once the fonts are ready.
  if (document.fonts && document.fonts.ready) {
    document.fonts.ready.then(() => document.querySelectorAll('[data-split]').forEach((h) => {
      if (!h.querySelector('.mark')) return;
      h.style.outline = '0 solid transparent';
      requestAnimationFrame(() => requestAnimationFrame(() => { h.style.outline = ''; }));
    }));
  }

  /* ---------------------------------------------------------------- reveal on scroll */
  document.querySelectorAll('[data-reveal-group]').forEach((group) => {
    group.querySelectorAll(':scope > [data-reveal]').forEach((el, n) => el.style.setProperty('--i', n));
  });
  document.querySelectorAll('[data-stagger]').forEach((group) => {
    [...group.children].forEach((el, n) => el.style.setProperty('--i', n));
  });

  function land(el) {
    el.classList.add('is-in');
    if (el.hasAttribute('data-split')) {
      // a mark inside a headline draws after the last word has landed
      const count = words.get(el) || 0;
      el.querySelectorAll('[data-draw]').forEach((svg) => {
        svg.style.setProperty('--draw-delay', `${count * 70 + 520}ms`);
        svg.classList.add('is-drawn');
      });
    }
    if (el.hasAttribute('data-draw')) el.classList.add('is-drawn');
  }

  // a [data-draw] inside a split headline waits for its words; every other one draws when it scrolls in
  const targets = document.querySelectorAll('[data-reveal], [data-split], .process, .map, [data-blink], [data-draw]:not([data-split] [data-draw])');
  const settle = (el) => {
    if (el.hasAttribute('data-blink')) setTimeout(() => el.classList.add('is-blinking'), 900);
    else land(el);
  };
  if ('IntersectionObserver' in window && !reduceMotion.matches) {
    // Chrome measures an element after its own clip-path, so a reveal that starts fully clipped
    // (wipe, bar) would never count as visible: watch its unclipped parent instead.
    const watched = new Map();
    targets.forEach((el) => {
      const key = el.matches('[data-reveal="wipe"], [data-reveal="bar"]') ? el.parentElement : el;
      if (!watched.has(key)) watched.set(key, []);
      watched.get(key).push(el);
    });
    const io = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        io.unobserve(entry.target);
        (watched.get(entry.target) || []).forEach(settle);
      });
    }, { rootMargin: '0px 0px -12% 0px', threshold: 0.01 });
    watched.forEach((_, key) => io.observe(key));
  } else {
    targets.forEach((el) => { if (!el.hasAttribute('data-blink')) land(el); });
  }

  /* ---------------------------------------------------------------- nav */
  const nav = document.querySelector('[data-nav]');
  if (nav) {
    const toggle = nav.querySelector('[data-nav-toggle]');
    const panel = nav.querySelector('[data-nav-panel]');
    const setOpen = (open) => {
      nav.classList.toggle('is-open', open);
      toggle.setAttribute('aria-expanded', String(open));
      toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
      panel.toggleAttribute('inert', !open);
    };
    panel.setAttribute('inert', '');
    toggle.addEventListener('click', () => setOpen(!nav.classList.contains('is-open')));
    panel.addEventListener('click', (e) => { if (e.target.closest('a')) setOpen(false); });
    document.addEventListener('keydown', (e) => { if (e.key === 'Escape' && nav.classList.contains('is-open')) { setOpen(false); toggle.focus(); } });
    window.matchMedia('(min-width: 992px)').addEventListener('change', (mq) => { if (mq.matches) setOpen(false); });
    const onScroll = () => nav.classList.toggle('is-scrolled', window.scrollY > 8);
    onScroll();
    window.addEventListener('scroll', onScroll, { passive: true });
  }

  /* ---------------------------------------------------------------- showreel: silent loop in the hero, full reel with sound in a lightbox */
  const reel = document.querySelector('[data-reel]');
  const lightbox = document.querySelector('[data-lightbox]');
  if (reel && lightbox) {
    const loop = reel.querySelector('[data-reel-loop]');
    const toggle = reel.querySelector('[data-reel-toggle]');
    const trigger = reel.querySelector('[data-reel-open]');
    const video = lightbox.querySelector('video');
    const close = lightbox.querySelector('[data-lightbox-close]');

    // reduced motion and data saver start paused; the pause button is always there (WCAG 2.2.2)
    let paused = reduceMotion.matches || Boolean(saveData);
    let inView = !('IntersectionObserver' in window);
    const sync = () => {
      const play = !paused && inView && !document.hidden && !lightbox.open;
      if (play) {
        if (loop.preload !== 'auto') loop.preload = 'auto';
        const p = loop.play();
        if (p && p.catch) p.catch(() => {});
      } else {
        loop.pause();
      }
      reel.classList.toggle('is-paused', paused);
      toggle.setAttribute('aria-label', paused ? 'Play the showreel loop' : 'Pause the showreel loop');
    };
    // if the loop file fails, the poster stays and the pause button goes: no dead control
    const sources = loop.querySelectorAll('source');
    if (sources.length) sources[sources.length - 1].addEventListener('error', () => reel.classList.add('is-broken'));
    loop.addEventListener('error', () => reel.classList.add('is-broken'));
    toggle.addEventListener('click', () => { paused = !paused; sync(); });
    if (!inView) new IntersectionObserver(([entry]) => { inView = entry.isIntersecting; sync(); }, { threshold: 0.2 }).observe(reel);
    document.addEventListener('visibilitychange', sync);
    reduceMotion.addEventListener('change', (mq) => { if (mq.matches) { paused = true; sync(); } });
    sync();

    const open = (e) => {
      e.preventDefault();
      lightbox.classList.remove('is-closing');
      lightbox.showModal();
      sync();
      const p = video.play();
      if (p && p.catch) p.catch(() => {});
    };
    const shut = () => {
      if (!lightbox.open || lightbox.classList.contains('is-closing')) return;
      video.pause();
      const done = () => { lightbox.close(); lightbox.classList.remove('is-closing'); trigger.focus(); sync(); };
      if (reduceMotion.matches) { done(); return; }
      lightbox.classList.add('is-closing');
      setTimeout(done, 280);
    };
    trigger.addEventListener('click', open);
    close.addEventListener('click', shut);
    lightbox.addEventListener('cancel', (e) => { e.preventDefault(); shut(); });
    lightbox.addEventListener('click', (e) => { if (e.target === lightbox) shut(); });
  }

  /* ---------------------------------------------------------------- accordions (<details>): animate height */
  document.querySelectorAll('details[data-accordion]').forEach((details) => {
    const summary = details.querySelector('summary');
    const body = details.querySelector('[data-accordion-body]');
    if (!summary || !body) return;
    let anim = null;
    summary.addEventListener('click', (e) => {
      if (reduceMotion.matches || !body.animate) return;
      e.preventDefault();
      if (anim) anim.cancel();
      if (details.open) {
        const from = body.offsetHeight;
        anim = body.animate({ height: [`${from}px`, '0px'] }, { duration: 300, easing: 'cubic-bezier(0.32, 0, 0.67, 0)' });
        anim.onfinish = () => { details.open = false; anim = null; };
      } else {
        details.open = true;
        const to = body.scrollHeight;
        anim = body.animate({ height: ['0px', `${to}px`] }, { duration: 420, easing: 'cubic-bezier(0.33, 1, 0.68, 1)' });
        anim.onfinish = () => { anim = null; };
      }
    });
  });

  /* ---------------------------------------------------------------- legal pages: highlight the current section in the contents */
  const toc = document.querySelector('[data-toc]');
  if (toc && 'IntersectionObserver' in window) {
    const links = new Map([...toc.querySelectorAll('a[href^="#"]')].map((a) => [a.getAttribute('href').slice(1), a]));
    const tocIo = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (!entry.isIntersecting) return;
        links.forEach((a) => a.classList.remove('is-current'));
        const a = links.get(entry.target.id);
        if (a) a.classList.add('is-current');
      });
    }, { rootMargin: '-20% 0px -70% 0px' });
    links.forEach((_, id) => { const s = document.getElementById(id); if (s) tocIo.observe(s); });
  }

  /* ---------------------------------------------------------------- analytics: Google Analytics 4, strictly opt-in */
  // Nothing from Google loads until the visitor presses Accept. The choice lives in localStorage ("ls-consent").
  const gaMeta = document.querySelector('meta[name="ga-id"]');
  const banner = document.querySelector('[data-consent]');
  if (gaMeta && banner) {
    const GA_ID = gaMeta.content;
    const KEY = 'ls-consent';
    const read = () => { try { return localStorage.getItem(KEY); } catch { return null; } };
    const write = (v) => { try { localStorage.setItem(KEY, v); } catch {} };
    let loaded = false;
    const loadGA = () => {
      if (loaded) return;
      loaded = true;
      window.dataLayer = window.dataLayer || [];
      window.gtag = function () { window.dataLayer.push(arguments); };
      window.gtag('consent', 'default', { analytics_storage: 'granted', ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied' });
      window.gtag('js', new Date());
      window.gtag('config', GA_ID, { allow_google_signals: false, allow_ad_personalization_signals: false });
      const s = document.createElement('script');
      s.async = true;
      s.src = `https://www.googletagmanager.com/gtag/js?id=${encodeURIComponent(GA_ID)}`;
      document.head.appendChild(s);
    };
    const clearGACookies = () => {
      const host = location.hostname;
      document.cookie.split(';').map((c) => c.trim().split('=')[0]).filter((n) => /^_ga/.test(n)).forEach((n) => {
        [host, '.' + host, '.' + host.replace(/^www\./, '')].forEach((d) => { document.cookie = `${n}=; Max-Age=0; path=/; domain=${d}`; });
        document.cookie = `${n}=; Max-Age=0; path=/`;
      });
    };
    const show = () => { banner.hidden = false; requestAnimationFrame(() => banner.classList.add('is-open')); };
    const hide = () => { banner.classList.remove('is-open'); banner.hidden = true; };
    banner.querySelectorAll('[data-consent-choice]').forEach((btn) => btn.addEventListener('click', () => {
      const choice = btn.dataset.consentChoice;
      const before = read();
      write(choice);
      hide();
      if (choice === 'granted') loadGA();
      else if (before === 'granted') { clearGACookies(); location.reload(); }
    }));
    document.querySelectorAll('[data-consent-open]').forEach((b) => b.addEventListener('click', show));
    // Key actions, sent only when GA is loaded (the visitor accepted). Names are what you mark as key events in GA.
    const track = (name, params) => { if (loaded && window.gtag) window.gtag('event', name, { page_path: location.pathname, ...params }); };
    document.addEventListener('click', (e) => {
      const a = e.target.closest('a, button');
      if (!a) return;
      const href = a.getAttribute('href') || '';
      const label = (a.textContent || '').replace(/\s+/g, ' ').trim().slice(0, 60);
      if (href.startsWith('https://calendar.app.google')) track('book_call', { link_text: label });
      else if (href.startsWith('https://forms.clickup.com')) track('apply_form_open', { link_text: label });
      else if (href.startsWith('mailto:')) track('email_click', { link_text: label });
      else if (a.matches('[data-reel-open]')) track('showreel_play');
      else if (/^https?:\/\//.test(href) && !href.startsWith(location.origin)) track('outbound_click', { link_url: href, link_text: label });
    }, { capture: true });
    const choice = read();
    if (choice === 'granted') loadGA();
    else if (choice !== 'denied') show();
  }

})();
