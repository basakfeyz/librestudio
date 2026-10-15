<!--page {"title": "Libre Studio Website: Design, SEO and GEO · Libre Studio", "description": "How we designed and built librestudio.co in plain HTML with Claude Code, with analytics only after opt-in consent, and SEO and GEO for Google and AI answers.", "path": "/work/librestudio-website/", "nav": "work"} -->
{{> head}}
{{> nav}}
<main id="main">

  <section class="section hero scheme-dark case-hero" aria-labelledby="case-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>Case study · Website, SEO and GEO</p>
          <h1 class="h1" id="case-title" data-split>A studio website built to be <span class="mark">found<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span></h1>
          <p class="text-lg" data-reveal>The site you are reading. Designed in Figma, built by hand in plain HTML, CSS and JavaScript with Claude Code, and set up so that both Google and AI answer engines can find it, read it and quote it.</p>
        </div>
      </div>
      <dl class="facts" data-reveal>
        <div><dt>Client</dt><dd>Libre Studio (our own site)</dd></div>
        <div><dt>Our role</dt><dd>Design, build, motion, SEO and GEO</dd></div>
        <div><dt>Built with</dt><dd>HTML, CSS, JavaScript, Claude Code, Netlify</dd></div>
        <div><dt>Code</dt><dd><a class="text-link" href="https://github.com/basakfeyz/librestudio" target="_blank" rel="noopener">On GitHub</a></dd></div>
      </dl>
    </div>
  </section>

  <section class="section scheme-light" aria-label="Homepage">
    <div class="container">
      <figure class="shot" data-reveal>
        <img src="/assets/img/work/librestudio/hero-1920.webp" srcset="/assets/img/work/librestudio/hero-960.webp 960w, /assets/img/work/librestudio/hero-1920.webp 1920w" sizes="(min-width: 1440px) 1280px, 92vw" width="1920" height="1200" alt="The librestudio.co homepage: the headline Digital experiences that resonate and result in action, with the showreel looping below." loading="lazy">
        <figcaption>The homepage: one headline, one hand-drawn mark, the showreel looping silently below.</figcaption>
      </figure>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="problem-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="problem-title" data-split>The problem</h2>
        <div class="text-lg prose" data-reveal>
          <p>The studio's domain only carried email. We needed a site that does three jobs at once: show the work to founders, recruit senior freelance designers, and stand up to a careful reader of privacy law, since candidates send personal data.</p>
          <p>And we wanted it found. Not only by Google, but by the AI tools founders now ask first: ChatGPT, Perplexity, Claude, Gemini and Copilot.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="did-title" data-split>What we did</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>One design system, Figma to code.</strong> Colours, type, spacing and radius come straight from the Figma variables. Where a colour pair failed WCAG AA contrast, we changed it.</li>
            <li><strong>Motion with a job.</strong> Headlines rise word by word, one hand-drawn mark draws on per page, service columns rise like bars. With reduced motion on, everything simply appears.</li>
            <li><strong>A light showreel.</strong> A 145 MB master became a 2.9 MB silent loop for the hero, with the full version loading only when someone presses play.</li>
            <li><strong>Private by default.</strong> Self-hosted fonts and video, analytics only after opt-in consent, no cookies before it, and a strict content security policy. Privacy notices in English and Turkish under KVKK.</li>
            <li><strong>A build that refuses mistakes.</strong> A short Node script assembles the pages and fails on any broken internal link or anchor, so a typo can never go live.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-coral" aria-labelledby="numbers-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="numbers-title" data-split>The site in numbers</h2>
      </div>
      <div class="stats" data-reveal-group>
        <div class="stat" data-reveal><span class="stat__num">0</span><p>third-party requests until you accept analytics</p></div>
        <div class="stat" data-reveal><span class="stat__num">0</span><p>frameworks or dependencies to maintain</p></div>
        <div class="stat" data-reveal><span class="stat__num">2.9 MB</span><p>hero showreel loop, down from a 145 MB master</p></div>
        <div class="stat" data-reveal><span class="stat__num">22</span><p>pages, each with its own structured data</p></div>
      </div>
    </div>
  </section>

  <section class="section scheme-dark" aria-labelledby="seo-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="seo-title" data-split>What is SEO and GEO?</h2>
        <div class="text-lg prose" data-reveal>
          <p>SEO, search engine optimisation, helps a site rank in Google and Bing. GEO, generative engine optimisation, helps it get named and quoted when someone asks an AI tool instead. They overlap, but GEO rewards different things: clear answers to specific questions, specific facts, and the same description of you repeated across the web.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="setup-title" data-split>How we set it up</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>Structured data on every page</strong>: the studio, its founder, services, projects, the showreel as a video, and FAQs read straight from the visible text, so the markup can never say more than the page. It passes Google's Rich Results Test.</li>
            <li><strong>An llms.txt file</strong> that summarises the studio and its pages for AI crawlers, and a robots.txt that welcomes Google, Bing, ChatGPT, Claude, Perplexity and Apple by name.</li>
            <li><strong>IndexNow</strong>: every deploy tells Bing, and the AI tools that read its index, which pages exist.</li>
            <li><strong>Google Search Console and Bing Webmaster Tools</strong>, with a sitemap that carries a last-updated date per page and links each English legal page to its Turkish twin.</li>
            <li><strong>Pages shaped like answers.</strong> Headings phrased as the questions people ask, a quotable definition near the top, and case studies with specific facts instead of adjectives.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="ai-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="ai-title" data-split>Where AI helped</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>Claude Code</strong> read the Figma design through the Figma MCP, wrote the templates and the build checks, and ran browser tests at desktop and phone sizes before every release.</li>
            <li><strong>Agents in parallel.</strong> Several pages were drafted by separate agents at the same time, each from its own source files, then reviewed and merged by a designer.</li>
            <li><strong>A designer made every call</strong>: the copy, the positioning, what to show and what to leave out. See <a class="text-link" href="/ai-design/">how we design with AI</a>.</li>
          </ul>
        </div>
      </div>
      <div class="shots" data-reveal-group>
        <figure class="shot" data-reveal>
          <img src="/assets/img/work/librestudio/services-1920.webp" srcset="/assets/img/work/librestudio/services-960.webp 960w, /assets/img/work/librestudio/services-1920.webp 1920w" sizes="(min-width: 1440px) 1280px, 92vw" width="1920" height="1200" alt="The services section: four coloured columns that rise like bars, each listing services with links to their pages." loading="lazy">
          <figcaption>Services rise like bars, taken from the showreel.</figcaption>
        </figure>
        <figure class="shot" data-reveal>
          <img src="/assets/img/work/librestudio/cycle-1920.webp" srcset="/assets/img/work/librestudio/cycle-960.webp 960w, /assets/img/work/librestudio/cycle-1920.webp 1920w" sizes="(min-width: 1440px) 1280px, 92vw" width="1920" height="1200" alt="The AI design page: One cycle, seven gates, with cards for each stage." loading="lazy">
          <figcaption>Pages written to answer one question each.</figcaption>
        </figure>
      </div>
    </div>
  </section>

  <section class="section scheme-royal" aria-labelledby="web-faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="web-faq-title" data-split>FAQs</h2>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>Can you do SEO and GEO for our site?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes, as part of a website project or on its own: structured data, llms.txt, crawler rules, sitemaps, Search Console and Bing setup, and page copy shaped to answer the questions your buyers ask.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Why no framework?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>A studio site is mostly words and images. Plain HTML, CSS and JavaScript load fast, never need upgrading and are easy for search engines and AI crawlers to read. For products, we build in Next.js. See <a class="text-link" href="/design-engineering/">design engineering</a>.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Is the code public?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes, on <a class="text-link" href="https://github.com/basakfeyz/librestudio" target="_blank" rel="noopener">GitHub</a>. The copy, brand assets, showreel and project images remain ours.</p></div></div>
        </details>
      </div>
    </div>
  </section>

  {{> work-next}}
</main>
{{> footer}}
