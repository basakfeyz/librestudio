<!--page {"title": "AI-Enhanced Product Design: How We Work with AI · Libre Studio", "description": "How Libre Studio designs with AI: one seven-stage cycle across Figma, Claude Code and Cursor, atomic design foundations, and a designer who decides at every gate.", "path": "/ai-design/", "nav": "ai"} -->
{{> head}}
{{> nav}}
<main id="main">

  <!-- Hero: dark, centred, one hand-drawn mark (landing hero pattern, no video) -->
  <section class="section hero scheme-dark" aria-labelledby="ai-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>AI-enhanced design</p>
          <h1 class="h1" id="ai-title" data-split>AI does the legwork. A <span class="mark">designer<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span> makes every call.</h1>
          <p class="text-lg" data-reveal>How we design UI, UX and products for startups with Claude Code, Cursor, Claude Design and Figma Make, on atomic design foundations that let your product, marketing and motion grow from one system.</p>
        </div>
        <div class="actions actions--center" data-reveal>
          <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
          <a class="btn btn--ghost-dark" href="#cycle"><span class="btn__label"><span data-text="See the cycle">See the cycle</span></span></a>
        </div>
      </div>
    </div>
  </section>

  <!-- Definition: the paragraph an answer engine can quote -->
  <section class="section scheme-light" aria-labelledby="what-title">
    <div class="container ai-def">
      <h2 class="h2" id="what-title" data-split>What is AI-assisted product design?</h2>
      <div class="text-lg ai-def__body" data-reveal>
        <p>AI-assisted product design means the repetitive parts of design work are done by AI agents: turning research into findings, checking every value against the design tokens, auditing motion and copy, writing tests, drafting handoff notes. The decisions are not. What a product should do, how it should feel and what ships stay with a senior designer.</p>
        <p>Some call it AI-powered design. We call it AI-assisted, because the AI never works alone. It reads the same specs we write, stops and asks when something needs judgment, and nothing it makes reaches you before a designer has approved it.</p>
      </div>
    </div>
  </section>

  <!-- The cycle: seven stages, each with what AI does and what the designer decides -->
  <section class="section scheme-coral" id="cycle" aria-labelledby="cycle-title">
    <div class="container">
      <div class="section-title center narrow">
        <h2 class="h2" id="cycle-title" data-split>One cycle, seven gates</h2>
        <p class="text-lg" data-reveal>Figma is where it is designed, ClickUp where it is tracked, Slack where people talk, and Claude Code where it is checked and built. The specs are the shared brain. A designer decides at every gate.</p>
      </div>
      <ol class="cycle" data-reveal-group>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">01</span>
          <h3 class="cycle__title">Set up</h3>
          <p><strong>AI</strong> scaffolds the project specs, runs a baseline audit and drafts specs from the Figma file.</p>
          <p><strong>Designer</strong> approves the structure.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">02</span>
          <h3 class="cycle__title">Intent</h3>
          <p><strong>AI</strong> turns raw research into sourced findings and drafts the intent.</p>
          <p><strong>Designer</strong> writes the acceptance criteria and approves them.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">03</span>
          <h3 class="cycle__title">Design</h3>
          <p><strong>AI</strong> prototypes from the specs and tokens, and stops to ask when no token fits.</p>
          <p><strong>Designer</strong> designs in Figma and answers the questions.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">04</span>
          <h3 class="cycle__title">QA</h3>
          <p><strong>AI</strong> runs design QA, token and motion audits, and a UX and copy review.</p>
          <p><strong>Designer</strong> fixes the gaps and approves any spec change.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">05</span>
          <h3 class="cycle__title">Review</h3>
          <p><strong>AI</strong> collects stakeholder comments from ClickUp and Slack and drafts the triage.</p>
          <p><strong>Designer</strong> accepts, rejects or defers each one.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">06</span>
          <h3 class="cycle__title">Build and release</h3>
          <p><strong>AI</strong> tests the build with Playwright and checks it against the approved design.</p>
          <p><strong>Designer</strong> approves the handoff and signs off the release.</p>
        </li>
        <li class="cycle__step" data-reveal>
          <span class="cycle__num">07</span>
          <h3 class="cycle__title">Learn</h3>
          <p><strong>AI</strong> proposes updates to the specs and the decision log.</p>
          <p><strong>Designer</strong> approves them, so the next project starts smarter.</p>
        </li>
      </ol>
    </div>
  </section>

  <!-- Tools -->
  <section class="section scheme-light" aria-labelledby="tools-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="tools-title" data-split>The tools, and where each one fits</h2>
        <p class="text-lg" data-reveal>Every tool has one job. Anything worth keeping ends up on the tokens and specs.</p>
      </div>
      <div class="tools" data-reveal-group>
        <div class="tools__group" data-reveal>
          <p class="eyebrow">Design</p>
          <dl>
            <dt>Figma</dt><dd>The source for designs and visual values: variables, components and review versions.</dd>
            <dt>Figma Make</dt><dd>Fast, throwaway prototypes and explorations.</dd>
            <dt>Claude Design</dt><dd>Quick visual drafts and directions to react to.</dd>
          </dl>
        </div>
        <div class="tools__group" data-reveal>
          <p class="eyebrow">Build and check</p>
          <dl>
            <dt>Claude Code</dt><dd>The hub: runs our agents, audits, fixes and drafts, and reads the specs first.</dd>
            <dt>Cursor</dt><dd>Where your developers build. Our specs and tokens are written to drop straight in.</dd>
            <dt>GitHub</dt><dd>Each project repo: specs, fix branches and release history.</dd>
          </dl>
        </div>
        <div class="tools__group" data-reveal>
          <p class="eyebrow">Reference</p>
          <dl>
            <dt>Mobbin</dt><dd>Real-world flows and patterns, each saved with a source note.</dd>
            <dt>Refero</dt><dd>UI and web references. Cited in research, never copied into specs.</dd>
          </dl>
        </div>
        <div class="tools__group" data-reveal>
          <p class="eyebrow">Track and talk</p>
          <dl>
            <dt>ClickUp</dt><dd>The record of tasks, findings and stakeholder comments.</dd>
            <dt>Slack</dt><dd>Where feedback arrives. Messages are drafted first and sent after approval.</dd>
          </dl>
        </div>
      </div>
    </div>
  </section>

  <!-- Auto-fix vs ask: the human-in-the-loop line, made concrete -->
  <section class="section scheme-light ai-split" aria-labelledby="split-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="split-title" data-split>What AI fixes, and what always waits for a designer</h2>
        <p class="text-lg" data-reveal>Every audit finding is either mechanical, with one exact answer, or a decision. AI only handles the first kind, and every fix is proven by a test before it counts.</p>
      </div>
      <div class="fit__grid">
        <div class="fit__card fit__card--lime" data-reveal>
          <h3 class="h4">Fixed automatically</h3>
          <ul class="checklist">
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span>A raw colour, spacing or radius that exactly matches an existing token becomes that token.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span>A raw duration or easing that matches a motion token.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span>A missing reduced-motion fallback, written the way the motion spec describes.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span>Each fix lands on its own branch with a test, for a designer to review.</span></li>
          </ul>
        </div>
        <div class="fit__card fit__card--light" data-reveal>
          <h3 class="h4">Stops and asks</h3>
          <ul class="checklist">
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M12 7v6M12 17h.01"/></svg><span>No token fits, or the nearest one differs from what was used.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M12 7v6M12 17h.01"/></svg><span>Figma and the spec disagree.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M12 7v6M12 17h.01"/></svg><span>A state nobody defined, or a contrast failure that needs a visual change.</span></li>
            <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M12 7v6M12 17h.01"/></svg><span>Any change to a spec, to the Figma file, or anything sent to you or your team.</span></li>
          </ul>
        </div>
      </div>
      <p class="ai-split__rule" data-reveal>The AI never loosens a check or edits a spec to make a test pass. After two failed attempts it stops and asks instead of trying a third time.</p>
    </div>
  </section>

  <!-- Atomic foundations, with the Echopod design system as the example -->
  <section class="section scheme-royal" aria-labelledby="atomic-title">
    <div class="container intro__grid">
      <div class="intro__copy">
        <div class="stack">
          <p class="tagline" data-reveal>Atomic design foundations</p>
          <div>
            <h2 class="h2" id="atomic-title" data-split>One system, everything grows from it.</h2>
            <div class="text-lg" data-reveal>
              <p>We build the foundations first: variables for colour, type, spacing and motion, named the same in Figma and in code. Components are made from those tokens, and screens from components.</p>
              <p>Because everything traces back to the same tokens, the UI, the marketing pages, the motion and the showreels stay consistent as you grow, and AI agents can check and extend them without guessing.</p>
            </div>
          </div>
        </div>
      </div>
      <figure class="intro__media intro__media--image ai-shot" data-reveal="wipe">
        <img src="/assets/img/projects/echopod-ds-1280.webp" srcset="/assets/img/projects/echopod-ds-640.webp 640w, /assets/img/projects/echopod-ds-1280.webp 1280w" sizes="(min-width: 992px) 600px, calc(100vw - 2 * clamp(1.25rem, 5vw, 4rem))" width="1280" height="853" loading="lazy" alt="Echopod Studio creator analytics dashboard: stat cards, a listens chart, a platform breakdown and an episodes table, all built from one design system.">
        <figcaption class="intro__caption"><strong>Echopod Design System</strong>One source of truth for mobile &amp; web apps.</figcaption>
      </figure>
    </div>
  </section>

  <!-- Deliverables -->
  <section class="section scheme-light" aria-labelledby="get-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="get-title" data-split>What you get</h2>
      </div>
      <ul class="checklist ai-get" data-reveal>
        <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span><strong>A token-strict Figma file.</strong> Every value bound to a variable, named the same as in your code.</span></li>
        <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span><strong>Component specs</strong> your developers and their AI tools can read.</span></li>
        <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span><strong>Cursor-ready handoff</strong> that drops into your team's setup without translation.</span></li>
        <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span><strong>Audit reports and tests</strong> that show what was checked, and how.</span></li>
        <li><svg viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg><span><strong>A decision log</strong>, so the reasons behind the design outlive the project.</span></li>
      </ul>
    </div>
  </section>

  <!-- FAQ -->
  <section class="section scheme-royal" aria-labelledby="ai-faq-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="ai-faq-title" data-split>FAQs</h2>
        <p class="text-lg" data-reveal>What founders ask about AI in design.</p>
      </div>
      <div class="faq__list" data-reveal>
        <details class="faq__item" data-accordion open>
          <summary class="faq__q"><span>Is AI-assisted design good enough to ship?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes, because nothing ships on the AI's say-so. Every screen passes design QA, a stakeholder review and a release check against the approved Figma file, and a designer signs off each one.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Does AI replace the designer?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>No. It replaces the repetitive parts: token checks, audits, first drafts and test writing. That leaves more of a senior designer's time for the decisions that shape your product.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Which AI tools do you use?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Claude Code for agents, audits and builds, Cursor for code, Claude Design and Figma Make for quick explorations, and Figma as the source of truth. Mobbin and Refero for references.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Who approves what?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>A designer approves every stage. Anything sent outward, like a message or a status change, is drafted by AI and sent only after a person approves it. Spec changes always need approval.</p></div></div>
        </details>
        <details class="faq__item" data-accordion>
          <summary class="faq__q"><span>Can you work inside our Cursor or Claude Code setup?</span><img class="faq__icon" src="/assets/img/figma/chevron-up.svg" width="32" height="32" alt=""></summary>
          <div class="faq__a" data-accordion-body><div><p>Yes. We hand off specs and tokens your developers can use directly in Cursor, and we can set up Claude Code skills tailored to your product.</p></div></div>
        </details>
      </div>
    </div>
  </section>

  <!-- CTA -->
  <section class="section scheme-dark" aria-labelledby="ai-cta-title">
    <div class="container">
      <div class="narrow cta">
      <div class="stack">
        <h2 class="h2" id="ai-cta-title" data-split>Send us your <em class="oblique">messiest</em> brief.</h2>
        <p class="text-lg" data-reveal>Senior design, sped up by AI, decided by people.</p>
      </div>
      <div class="actions actions--center" data-reveal>
        <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
        <a class="btn btn--ghost-dark" href="/#projects"><span class="btn__label"><span data-text="See our projects">See our projects</span></span></a>
      </div>
    </div>
    </div>
  </section>
</main>
{{> footer}}
