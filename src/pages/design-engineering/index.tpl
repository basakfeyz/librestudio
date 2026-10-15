<!--page {"title": "Design Engineering for Startups: Figma to Code · Libre Studio", "description": "Design engineering for startups: designs that arrive as working front ends, Figma built from specs with Claude Code, and handoff ready for Cursor.", "path": "/design-engineering/", "nav": "services"} -->
{{> head}}
{{> nav}}
<main id="main">

  <section class="section hero scheme-dark case-hero" aria-labelledby="de-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>Design engineering</p>
          <h1 class="h1" id="de-title" data-split>Design that arrives as working <span class="mark">code<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span></h1>
          <p class="text-lg" data-reveal>We design in Figma and build in code, so the gap between the two never opens. For startups that want a landing page, a prototype or a front end that looks exactly like the design.</p>
        </div>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
          <a class="btn btn--ghost-dark" href="/work/tales-ai-landing/"><span class="btn__label"><span data-text="See an example">See an example</span></span></a>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="what-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="what-title" data-split>What is design engineering?</h2>
        <div class="text-lg prose" data-reveal>
          <p>Design engineering is design and front-end code done by the same team. Instead of a Figma file that a developer interprets, you get the interface itself: built, responsive, animated and accessible, matching the design because it is the design.</p>
          <p>It matters most where small details decide the result: a landing page that has to convert, an onboarding that has to feel right, a prototype investors will click through.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="how-title" data-split>How we work</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>Specs first.</strong> Each flow is written down as a short spec: what the screen is for, its states, its copy. Specs are what both people and AI agents read.</li>
            <li><strong>Figma from the specs.</strong> We build Figma screens and components through Claude Code and the Figma MCP, on design tokens named the same as in code. A designer designs every screen and corrects every output.</li>
            <li><strong>Prototypes in HTML.</strong> Clickable prototypes that behave like the product, not linked frames, so decisions get tested on real interactions.</li>
            <li><strong>Production front ends</strong> in Next.js and Tailwind CSS, or plain HTML, CSS and JavaScript when that is all a page needs, with motion in GSAP or CSS.</li>
            <li><strong>Checked before it ships.</strong> Token audits, accessibility checks and automated tests compare the build to the approved design.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-coral" aria-labelledby="example-title">
    <div class="container split-rows">
      <div class="section-title narrow">
        <p class="tagline" data-reveal>Example</p>
        <h2 class="h2" id="example-title" data-split>Tales AI landing page</h2>
        <p class="text-lg" data-reveal>A pre-launch waitlist page for an AI bedtime-story app, designed for conversion and built by us in Next.js, Tailwind CSS and GSAP. <a class="text-link" href="/work/tales-ai-landing/">Read the case study</a>.</p>
      </div>
      <figure class="shot" data-reveal>
        <img src="/assets/img/work/tales/hero-1920.webp" srcset="/assets/img/work/tales/hero-960.webp 960w, /assets/img/work/tales/hero-1920.webp 1920w" sizes="(min-width: 1440px) 1280px, 92vw" width="1920" height="1200" alt="Tales AI landing page hero with the headline Your voice, Their adventure, a waitlist email field and storybook illustrations." loading="lazy">
      </figure>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="also-title">
    <div class="container ai-def">
      <h2 class="h2" id="also-title" data-split>Also built this way</h2>
      <div class="text-lg prose" data-reveal>
        <ul>
          <li><strong>This website.</strong> Designed in Figma and built in plain HTML, CSS and JavaScript with Claude Code, no framework, with every animation tied to our motion rules. The code is public on <a class="text-link" href="https://github.com/basakfeyz/librestudio" target="_blank" rel="noopener">GitHub</a>.</li>
          <li><strong><a class="text-link" href="/work/lula/">Lula</a>.</strong> Three clickable HTML prototypes of the onboarding in about two weeks, then a Figma design system the client's developers built the app from.</li>
          <li><strong><a class="text-link" href="/work/mona-ai/">MONA AI</a>.</strong> The splash animation, delivered as a ready React Native component.</li>
        </ul>
      </div>
    </div>
  </section>

  <section class="section scheme-royal" aria-labelledby="de-faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="de-faq-title" data-split>FAQs</h2>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>Do you replace our developers?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>No. We build the parts where design and code meet: landing pages, prototypes, interfaces and motion. Your developers own the product's back end and architecture, and get front-end work they can merge rather than rebuild.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Which stack do you build in?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Next.js and Tailwind CSS for web apps and marketing sites, plain HTML, CSS and JavaScript for light pages, and GSAP or CSS for motion. For mobile, we hand off specs, tokens and components ready for your React Native or native developers.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Can you work in our repo and our Cursor setup?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes. We work on a branch in your repository, follow your conventions, and write specs and tokens your developers can use directly in Cursor.</p></div></div>
        </details>
      </div>
    </div>
  </section>

  {{> work-next}}
</main>
{{> footer}}
