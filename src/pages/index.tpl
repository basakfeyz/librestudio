<!--page {"title": "AI-Enhanced Product Design Studio for Startups · Libre Studio", "description": "UI, UX and product design for startups, made with AI-assisted workflows and a designer in charge. Design engineering, motion and atomic design systems in Claude Code, Cursor and Figma Make.", "path": "/", "nav": "home"} -->
{{> head}}
{{> nav}}
<main id="main">

  <!-- Header / 28: hero, the showreel loops in the lightbox slot -->
  <section class="section hero scheme-dark" aria-labelledby="hero-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <h1 class="h1" id="hero-title" data-split>Digital experiences that resonate and result in <span class="mark">action<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span></h1>
          <p class="text-lg" data-reveal>AI-enhanced UI, UX and product design for startups. Design engineering and motion on atomic design foundations, so your product, marketing and showreels scale from one system.</p>
        </div>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
          <a class="btn btn--ghost-dark" href="/careers/"><span class="btn__label"><span data-text="Join the Studio">Join the Studio</span></span></a>
        </div>
      </div>

      <div class="reel" id="reel" data-reel data-reveal="wipe">
        <video class="reel__loop" data-reel-loop muted loop playsinline preload="none" poster="/assets/video/showreel-loop-poster.webp" aria-hidden="true" tabindex="-1">
          <source src="/assets/video/showreel-loop-480.mp4" type="video/mp4" media="(max-width: 767px)">
          <source src="/assets/video/showreel-loop-720.mp4" type="video/mp4">
        </video>
        <a class="reel__open" href="/assets/video/showreel-1080.mp4" data-reel-open aria-haspopup="dialog" aria-label="Watch the full showreel with sound, 1 minute 24 seconds">
          <span class="reel__watch"><img src="/assets/img/figma/play-button.svg" width="24" height="24" alt="">Watch with sound <span class="reel__time">1:24</span></span>
        </a>
        <button class="reel__toggle" type="button" data-reel-toggle aria-label="Pause the showreel loop">
          <svg class="reel__icon-pause" viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M8 5v14M16 5v14"/></svg>
          <svg class="reel__icon-play" viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M8 5.5v13l10.5-6.5z"/></svg>
        </button>
      </div>
    </div>
  </section>

  <!-- Services: the four columns from the showreel (Growth Figma 499:535, Asset Language §4.3) -->
  <section class="scheme-light svc" id="services" aria-labelledby="services-title">
    <div class="section section--md services-head">
      <h2 class="h2 center" id="services-title" data-split>AI-enhanced design services</h2>
    </div>
    <div class="svc__grid" data-reveal-group>
      <article class="svc__col svc__col--coral" data-reveal="bar">
        <h3 class="svc__title">UX &amp; Product Design</h3>
        <ul class="svc__list"><li>Strategy &amp; concepting</li><li>UX audit</li><li>User research</li><li>A/B testing &amp; heat mapping</li><li>User journeys</li><li>User testing</li></ul>
      </article>
      <article class="svc__col svc__col--violet" data-reveal="bar">
        <h3 class="svc__title">UI Design</h3>
        <ul class="svc__list"><li>UI audit</li><li>Website design</li><li>Web apps</li><li>Mobile app UI</li><li><a class="svc__link" href="/design-systems/">Atomic design systems</a></li><li>SaaS &amp; dashboards</li></ul>
      </article>
      <article class="svc__col svc__col--royal" data-reveal="bar">
        <h3 class="svc__title">Interaction, AI &amp; No-Code</h3>
        <ul class="svc__list"><li>No-code development</li><li>Interaction design</li><li>Prototyping</li><li>Developer handoff</li><li><a class="svc__link" href="/design-engineering/">Design engineering</a></li><li><a class="svc__link" href="/ai-design/">AI design workflows</a></li></ul>
      </article>
      <article class="svc__col svc__col--lime" data-reveal="bar">
        <h3 class="svc__title">Product Marketing</h3>
        <ul class="svc__list"><li>Pitch deck</li><li>Sales deck</li><li><a class="svc__reel" href="#reel">Showreel<svg class="svc__circle" viewBox="0 0 120 44" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M70 6 C 34 2, 4 10, 5 23 C 6 36, 46 42, 82 38 C 110 35, 120 24, 112 14 C 104 5, 80 3, 58 6"/></svg></a></li><li>Product explanation video</li><li>Presentation design</li><li>Motion video</li><li><a class="svc__link" href="/motion-design/">Motion design</a></li></ul>
      </article>
    </div>
  </section>

  <!-- Projects -->
  <section class="section scheme-light" id="projects" aria-labelledby="projects-title">
    <div class="container">
      <div class="section-title center narrow">
        <h2 class="h2" id="projects-title" data-split>Projects</h2>
      </div>
      <ul class="proj__grid" data-reveal-group>
        <li data-reveal><a class="proj" href="/work/lula/">
          <span class="proj__cover proj__cover--lula"><img class="proj__icon" src="/assets/img/projects/lula-icon.webp" width="128" height="128" alt=""></span>
          <span class="proj__name">Lula: AI Bedtime Stories</span>
          <span class="proj__tag">A new story, every night.</span>
        </a></li>
        <li data-reveal><a class="proj" href="/work/mona-ai/">
          <span class="proj__cover proj__cover--mona"><img class="proj__icon" src="/assets/img/projects/mona-icon.webp" width="128" height="128" alt=""></span>
          <span class="proj__name">MONA AI: Photo &amp; Video Studio</span>
          <span class="proj__tag">Your face, 500+ styles.</span>
        </a></li>
        <li data-reveal><a class="proj" href="/work/tales-ai-landing/">
          <span class="proj__cover proj__cover--shot"><img class="proj__shot" src="/assets/img/work/tales/hero-960.webp" width="960" height="600" alt="" loading="lazy"></span>
          <span class="proj__name">Tales AI landing page</span>
          <span class="proj__tag">CRO-focused, AI-illustrated, built in Next.js.</span>
        </a></li>
        <li data-reveal><a class="proj" href="/work/echopod-ux-audit/">
          <span class="proj__cover proj__cover--echopod"><span class="proj__wordmark">Echopod<span>UX Audit</span></span></span>
          <span class="proj__name">Echopod UX Audit</span>
          <span class="proj__tag">The full audit, walked through.</span>
        </a></li>
        <li data-reveal><div class="proj">
          <span class="proj__cover proj__cover--shot"><img class="proj__shot" src="/assets/img/projects/echopod-ds-640.webp" srcset="/assets/img/projects/echopod-ds-640.webp 640w, /assets/img/projects/echopod-ds-1280.webp 1280w" sizes="(min-width: 992px) 300px, (min-width: 600px) 45vw, 90vw" width="640" height="427" loading="lazy" alt="Echopod Studio creator analytics dashboard, built from the Echopod design system"></span>
          <span class="proj__name">Echopod Design System</span>
          <span class="proj__tag">One source of truth for mobile &amp; web apps.</span>
        </div></li>
      </ul>
      <p class="proj__more" data-reveal>More projects are on their way.</p>
    </div>
  </section>

  <!-- Layout / 298: process, coral with ink text -->
  <section class="section scheme-coral" id="process" aria-labelledby="process-title">
    <div class="container">
      <div class="section-title center narrow">
        <h2 class="h2" id="process-title" data-split>Our Process</h2>
        <p class="text-lg" data-reveal>From the kickoff call to optimisation. The same steps on every project.</p>
      </div>
      <div class="process">
        <div class="process__line" aria-hidden="true"></div>
        <ol class="process__steps" data-stagger>
          <li class="process__step"><span class="process__num" aria-hidden="true">01</span><div class="stack"><h3 class="h5">Strategy</h3><p>A kickoff call, then time, budget and milestone estimates, and a small demo task before anything is signed.</p></div></li>
          <li class="process__step"><span class="process__num" aria-hidden="true">02</span><div class="stack"><h3 class="h5">Design</h3><p>UX, UI and prototyping in one loop, with AI in the workflow and QA before every handoff.</p></div></li>
          <li class="process__step"><span class="process__num" aria-hidden="true">03</span><div class="stack"><h3 class="h5">Development</h3><p>A token-strict Figma file your developers build from, or a no-code build when that ships faster.</p></div></li>
          <li class="process__step"><span class="process__num" aria-hidden="true">04</span><div class="stack"><h3 class="h5">Measure &amp; Optimise</h3><p>A post-project review, then test, measure and optimise what is live.</p></div></li>
        </ol>
      </div>
    </div>
  </section>

  <!-- Testimonial / 4 -->
  <section class="section scheme-light" aria-label="What a client said">
    <figure class="narrow quote" data-reveal>
      <blockquote class="quote__text"><p>“You ask the right questions and bring the right solutions so we can build the right product.”</p></blockquote>
      <figcaption class="quote__by">A client</figcaption>
    </figure>
  </section>

  <!-- FAQ / 2 -->
  <section class="section scheme-royal" aria-labelledby="faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="faq-title" data-split>FAQs</h2>
        <p class="text-lg" data-reveal>Answers to what founders ask first.</p>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>What services do you offer?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Product design end to end: UX research and audits, UI for web and mobile apps, design systems, websites, prototypes and developer handoff. Plus pitch decks, showreels and product videos when a launch needs them.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>How do you use AI?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Every day, with a designer in charge of every decision. We work in Claude Code, Cursor, Claude Design and Figma Make, on atomic design foundations, so the UI, the marketing pages, the motion and the showreels all grow from one system. AI makes the work faster. The design decisions stay human. <a class="text-link" href="/ai-design/">See how we work with AI</a>.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>How do I start?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Book a call and bring the brief, however messy. If we are a fit, you get time, budget and milestone estimates, then a small demo task.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>What is your process?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Kickoff call, estimates and a demo task. Then the work in milestones: UX, UI, prototype, QA and handoff, looping until it is right. After launch: review, test, measure, optimise.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Do you offer support?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes. Every handoff includes a round of questions and answers with your developers, and a post-project review is part of the process.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Can I see examples?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes. See our <a class="text-link" href="#projects">projects</a> and the <a class="text-link" href="#reel">showreel</a> at the top of this page. On a call we walk you through the work closest to your product.</p></div></div>
        </details>
      </div>
    </div>
  </section>

  <!-- CTA / 25 -->
  <section class="section scheme-dark" aria-labelledby="cta-title">
    <div class="container">
      <div class="narrow cta">
        <div class="stack">
          <h2 class="h2" id="cta-title" data-split>Send us your <em class="oblique">messiest</em> brief.</h2>
          <p class="text-lg" data-reveal>Senior design without the full-time hire. Research to dev-ready prototype.</p>
        </div>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
          <a class="btn btn--ghost-dark" href="/careers/"><span class="btn__label"><span data-text="Join the Studio">Join the Studio</span></span></a>
        </div>
      </div>
    </div>
  </section>
</main>

<dialog class="lightbox" data-lightbox aria-label="Showreel 2026">
  <div class="lightbox__frame">
    <video class="lightbox__video" controls playsinline preload="none" poster="/assets/video/showreel-loop-poster.webp">
      <source src="/assets/video/showreel-720.mp4" type="video/mp4" media="(max-width: 767px)">
      <source src="/assets/video/showreel-1080.mp4" type="video/mp4">
      <p>Your browser can't play this video here. <a href="/assets/video/showreel-1080.mp4">Download the showreel</a> (17 MB).</p>
    </video>
  </div>
  <button class="lightbox__close" type="button" data-lightbox-close aria-label="Close the showreel"><img src="/assets/img/figma/plus.svg" width="32" height="32" alt=""></button>
</dialog>
{{> footer}}
