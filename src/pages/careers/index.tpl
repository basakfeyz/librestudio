<!--page {"title": "Careers · Libre Studio", "description": "Join Libre Studio, a remote product design studio for startups and B2B SaaS teams. We work with high-agency designers, freelance and full-time.", "path": "/careers/", "nav": "careers"} -->
{{> head}}
{{> nav}}
<main id="main">

  <!-- Layout / 1 -->
  <section class="section scheme-light" aria-labelledby="careers-title">
    <div class="container intro__grid">
      <div class="intro__copy">
        <div class="stack">
          <p class="tagline" data-reveal>Careers</p>
          <div>
            <h1 class="h2" id="careers-title" data-split>Design real products with a small, <em class="oblique">senior</em> studio.</h1>
            <div class="text-lg" data-reveal>
              <p>Libre Studio is a remote product design studio for startups and B2B SaaS teams: web apps, mobile apps, websites and the systems behind them.</p>
              <p>We look for designers who own their work, communicate early and use AI well. Some roles are freelance, some full-time.</p>
            </div>
          </div>
        </div>
        <div class="actions" data-reveal>
          <a class="btn btn--ghost-light" href="#how-hiring-works"><span class="btn__label"><span data-text="How Hiring Works">How Hiring Works</span></span></a>
          <a class="link-arrow" href="/careers/apply/">Apply <img src="/assets/img/figma/chevron-right.svg" width="24" height="24" alt=""></a>
        </div>
      </div>
      <figure class="intro__media intro__media--image" data-reveal="wipe">
        <img src="/assets/img/work-toucan-840.webp" srcset="/assets/img/work-toucan-420.webp 420w, /assets/img/work-toucan-840.webp 840w" sizes="(min-width: 992px) 600px, calc(100vw - 2 * clamp(1.25rem, 5vw, 4rem))" width="840" height="896" alt="Screens from our web apps, mobile apps, dashboards, websites and UX audits, arranged into the Libre Studio toucan.">
      </figure>
    </div>
  </section>

  <!-- Career / 9 -->
  <section class="section scheme-helio" id="roles" aria-labelledby="roles-title">
    <div class="container openings__grid">
      <div class="openings__head">
        <p class="tagline" data-reveal>Open roles</p>
        <div>
          <h2 class="h2" id="roles-title" data-split>Join the Studio</h2>
          <p class="text-lg" data-reveal>Remote. Freelance or full-time, depending on the role.</p>
        </div>
      </div>
      <div data-reveal>
        <details class="group" data-accordion open>
          <summary class="group__head"><span class="h4">Design</span><img class="group__icon" src="/assets/img/figma/plus.svg" width="32" height="32" alt=""></summary>
          <div class="group__body" data-accordion-body>
            <article class="job">
              <div class="job__top">
                <div class="job__title"><h3 class="h5">Senior Product Designer</h3><p class="job__meta">Remote · Freelance</p></div>
                <a class="btn btn--lime btn--sm" href="/careers/apply/" aria-label="Apply now: Senior Product Designer">Apply Now</a>
              </div>
              <p>Product work for startups and B2B SaaS teams: UX research, mobile, web apps, websites and CRO.</p>
            </article>
            <article class="job">
              <div class="job__top">
                <div class="job__title"><h3 class="h5">Not listed yet?</h3><p class="job__meta">Remote · Any level</p></div>
                <a class="btn btn--lime btn--sm" href="mailto:{{email}}?subject=Open%20application" aria-label="Email us an open application">Email Us</a>
              </div>
              <p>We open new roles from time to time, full-time ones included. Email your portfolio link to <a class="text-link" href="mailto:{{email}}?subject=Open%20application">{{email}}</a> and tell us where you fit.</p>
            </article>
          </div>
        </details>
      </div>
    </div>
  </section>

  <!-- How hiring works: transit map (Asset Language §4.4) -->
  <section class="section scheme-royal" id="how-hiring-works" aria-labelledby="map-title">
    <div class="container">
      <div class="section-title narrow">
        <p class="eyebrow" data-reveal>How hiring works</p>
        <h2 class="h2" id="map-title" data-split>Simple, and the same for everyone.</h2>
        <p class="text-lg" data-reveal>Steps can vary a little by role. We share the details once you apply.</p>
      </div>
      <div class="map map--4">
        <svg class="map__svg map__svg--h" viewBox="0 0 1000 120" aria-hidden="true" focusable="false">
          <g data-draw>
            <path class="map__line" d="M16 60 C 100 18, 186 18, 270 60 C 354 102, 440 102, 524 60 C 608 18, 694 18, 778 60 C 860 98, 940 92, 1000 70"/>
          </g>
          <g data-stagger>
            <g class="map__dot-g"><circle class="map__dot" cx="16" cy="60" r="14"/><circle class="map__dot-core" cx="16" cy="60" r="5"/></g>
            <g class="map__dot-g"><circle class="map__dot" cx="270" cy="60" r="14"/><circle class="map__dot-core" cx="270" cy="60" r="5"/></g>
            <g class="map__dot-g"><circle class="map__dot" cx="524" cy="60" r="14"/><circle class="map__dot-core" cx="524" cy="60" r="5"/></g>
            <g class="map__dot-g"><circle class="map__dot" cx="778" cy="60" r="14"/><circle class="map__dot-core" cx="778" cy="60" r="5"/></g>
          </g>
        </svg>
        <ol class="map__stops" data-stagger>
          <li class="stop"><span class="stop__num">01</span><h3 class="stop__title">Apply</h3><p>Your work and a few short answers.</p></li>
          <li class="stop"><span class="stop__num">02</span><h3 class="stop__title">Talk</h3><p>A conversation about how you work and what you're looking for.</p></li>
          <li class="stop"><span class="stop__num">03</span><h3 class="stop__title">Try</h3><p>A small trial project, close to the real work.</p></li>
          <li class="stop"><span class="stop__num">04</span><h3 class="stop__title">Join</h3><p>Onboarding, then your first project with us.</p></li>
        </ol>
      </div>
    </div>
  </section>

  <!-- CTA / 25, lightened -->
  <section class="section section--md scheme-coral" aria-labelledby="band-title">
    <div class="container">
      <div class="narrow cta">
        <h2 class="h3" id="band-title" data-split>Sounds like you?</h2>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="/careers/apply/"><span class="btn__label"><span data-text="Apply">Apply</span></span></a>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ / 2 -->
  <section class="section scheme-royal" aria-labelledby="careers-faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="careers-faq-title" data-split>FAQs</h2>
        <p class="text-lg" data-reveal>How we work, in short.</p>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>Where do you work?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>We're 100% remote, based in Istanbul (GMT+3), and ask for a few hours of overlap with Istanbul time on working days. We meet in person from time to time, when it makes sense.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Freelance or full-time?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Both, depending on the role and the projects we have. Each role says which. If you're open to either, tell us in your application.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Who does well here?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>High-agency people. You own your work, flag problems early and move things forward without being chased. We don't micromanage, and we're not a fit if you need someone to.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>How do you use AI?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Every day, across research, design and handoff. We expect you to use it well, check what it gives you and say where you used it. The design decisions stay human.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>What language do you work in?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>English, mostly in writing, with occasional Turkish. Clear written communication matters as much as the design.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>What happens to my data?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>We use it for your application only. Details in the <a class="text-link" href="/privacy/">privacy notice</a> (English) and the <a class="text-link" href="/kvkk-aday/" lang="tr">KVKK aydınlatma metni</a> (Türkçe).</p></div></div>
        </details>
      </div>
    </div>
  </section>
</main>
{{> footer}}
