<!--page {"title": "Atomic Design Systems for Startups: Tokens, Components, One Source of Truth · Libre Studio", "description": "Atomic design systems for startups: design tokens named the same in Figma and code, atoms and molecules your team reuses, and AI agents that check every value against them.", "path": "/design-systems/", "nav": "services"} -->
{{> head}}
{{> nav}}
<main id="main">

  <section class="section hero scheme-dark case-hero" aria-labelledby="ds-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>Atomic design systems</p>
          <h1 class="h1" id="ds-title" data-split>One source of <span class="mark">truth<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span> for product, marketing and motion</h1>
          <p class="text-lg" data-reveal>We build atomic design systems for startups: tokens, components and rules that your designers, your developers and their AI tools all read the same way.</p>
        </div>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
          <a class="btn btn--ghost-dark" href="/work/lula/"><span class="btn__label"><span data-text="See an example">See an example</span></span></a>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="why-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="why-title" data-split>Why atomic?</h2>
        <div class="text-lg prose" data-reveal>
          <p>Atomic design builds an interface from the smallest parts up. Tokens (colour, type, spacing, radius, motion) make atoms like buttons and inputs. Atoms make molecules like cards and form rows. Molecules make screens.</p>
          <p>When everything traces back to the same tokens, a change in one place reaches everywhere: the app, the marketing site, the pitch deck, the showreel. And because the names match in Figma and in code, AI agents can check and extend the system without guessing.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="inside-title" data-split>What you get</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>Design tokens</strong> as Figma variables, with the same names as in your code.</li>
            <li><strong>Atoms and molecules</strong> with every state: default, hover, pressed, disabled, error, empty, loading.</li>
            <li><strong>Component specs</strong> in plain words, readable by people and by AI tools.</li>
            <li><strong>Motion tokens</strong>, so movement stays consistent too.</li>
            <li><strong>Audits that keep it honest:</strong> AI agents flag raw values that should be tokens, and missing states, before they reach production.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-coral" aria-labelledby="example-title">
    <div class="container">
      <div class="section-title narrow">
        <p class="tagline" data-reveal>Example</p>
        <h2 class="h2" id="example-title" data-split>The Lula design system</h2>
        <p class="text-lg" data-reveal>For <a class="text-link" href="/work/lula/">Lula</a>, an AI bedtime-story app, the client's developers built the app straight from this Figma system.</p>
      </div>
      <div class="stats stats--3" data-reveal-group>
        <div class="stat" data-reveal><span class="stat__num">137</span><p>design tokens as Figma variables</p></div>
        <div class="stat" data-reveal><span class="stat__num">96</span><p>component variants across 17 atoms</p></div>
        <div class="stat" data-reveal><span class="stat__num">13</span><p>molecules built from those atoms</p></div>
      </div>
    </div>
  </section>

  <section class="section scheme-royal" aria-labelledby="echo-title">
    <div class="container intro__grid">
      <div class="intro__copy">
        <div class="stack">
          <p class="tagline" data-reveal>Also</p>
          <div>
            <h2 class="h2" id="echo-title" data-split>Echopod Design System</h2>
            <div class="text-lg" data-reveal>
              <p>One source of truth for a creator-analytics product across mobile and web: stat cards, charts, tables and navigation, all from one set of tokens.</p>
            </div>
          </div>
        </div>
      </div>
      <figure class="intro__media intro__media--image ai-shot" data-reveal="wipe">
        <img src="/assets/img/projects/echopod-ds-1280.webp" srcset="/assets/img/projects/echopod-ds-640.webp 640w, /assets/img/projects/echopod-ds-1280.webp 1280w" sizes="(min-width: 992px) 600px, calc(100vw - 2 * clamp(1.25rem, 5vw, 4rem))" width="1280" height="853" loading="lazy" alt="Echopod Studio creator analytics dashboard built from the Echopod design system.">
      </figure>
    </div>
  </section>

  <section class="section scheme-dark" aria-labelledby="ds-faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="ds-faq-title" data-split>FAQs</h2>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>Do we need a design system this early?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>You need its foundations: tokens and a handful of core components. They cost little at the start and save a rebuild later.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Can you fix our existing Figma file?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes. We audit it, bind raw values to tokens, rename layers to match the code and fill in missing states.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Does it work with AI coding tools?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>That is the point of naming tokens the same in Figma and code: Cursor and Claude Code can use them without translation.</p></div></div>
        </details>
      </div>
    </div>
  </section>

  {{> work-next}}
</main>
{{> footer}}
