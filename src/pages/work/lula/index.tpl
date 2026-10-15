<!--page {"title": "Lula: AI Bedtime Stories, UI/UX Case Study · Libre Studio", "description": "How we designed Lula, an AI bedtime-story app, end to end: the first story before the paywall, a hand-made illustration style, a 137-token design system.", "path": "/work/lula/", "nav": "work"} -->
{{> head}}
{{> nav}}
<main id="main">

  <section class="section hero scheme-dark case-hero" aria-labelledby="case-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>Case study · Mobile app</p>
          <h1 class="h1" id="case-title" data-split>Lula: an AI app that feels <span class="mark">hand-made<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span></h1>
          <p class="text-lg" data-reveal>A new bedtime story every night, starring your child and read in your voice. We designed it end to end, from research to the design system the app was built from.</p>
        </div>
      </div>
      <dl class="facts" data-reveal>
        <div><dt>Client</dt><dd>Horus Studios</dd></div>
        <div><dt>Our role</dt><dd>End-to-end UI/UX design</dd></div>
        <div><dt>Platform</dt><dd>iOS</dd></div>
        <div><dt>Status</dt><dd><a class="text-link" href="https://apps.apple.com/tr/app/lula-ai-bedtime-stories/id6775413640" target="_blank" rel="noopener">On the App Store</a> since September 2026</dd></div>
      </dl>
    </div>
  </section>

  <section class="section scheme-light" aria-label="Onboarding screens">
    <div class="container">
      <div class="phones" data-reveal-group>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/01_0a-720.webp" srcset="/assets/img/work/lula/01_0a-360.webp 360w, /assets/img/work/lula/01_0a-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Welcome screen: the star mascot Luna in a nightcap says hi under the working name tales ai." loading="lazy"><figcaption>Luna, the guide, opens every session.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/08_2a-720.webp" srcset="/assets/img/work/lula/08_2a-360.webp 360w, /assets/img/work/lula/08_2a-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Onboarding question: what should your little one grow into slowly, with illustrated cards for kindness and curiosity." loading="lazy"><figcaption>Every answer feeds the first story.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/20_s11-720.webp" srcset="/assets/img/work/lula/20_s11-360.webp 360w, /assets/img/work/lula/20_s11-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Read-along screen of the first story, ending in the prompt shall we find out what happens to the little star, with a Hear how it ends button." loading="lazy"><figcaption>The paywall arrives mid-story: Hear how it ends.</figcaption></figure>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="problem-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="problem-title" data-split>The problem</h2>
        <div class="text-lg prose" data-reveal>
          <p>AI bedtime-story apps are a crowded category. Most offer personalised stories, many offer a cloned parent's voice. The feature list was never going to set this one apart, so the first two minutes had to.</p>
          <p>Two things stood in the way. Parents can't judge a story app until they hear a story, so a paywall before that point asks for trust the app hasn't earned. And parents are wary of AI content for small children: anything that looks machine-made loses them.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="did-title" data-split>What we did</h2>
        <div class="text-lg prose" data-reveal>
          <p>We were the product designer end to end: research synthesis, the MVP brief, brand guidelines, information architecture, six specced flows (onboarding, discover, listen, story generation, paywall, profile), wireframes, HTML prototypes, and the Figma design system and screens.</p>
          <ul>
            <li><strong>The first story comes before the paywall.</strong> Onboarding generates a personalised story, and the read-along cuts to the paywall at the best part: "Hear how it ends". The paywall becomes the payoff of a promise, not a surprise upsell.</li>
            <li><strong>Setup that feels like making something.</strong> Luna reacts to every answer, and every answer becomes a story input, so setup feels like making a gift for your child rather than filling in a form.</li>
            <li><strong>Parents stay in control.</strong> A parent approves the story script before narration runs, so they decide what the AI tells their child.</li>
            <li><strong>No dead end while the voice is cloned.</strong> The wait stays inside onboarding, with Luna keeping company.</li>
            <li><strong>A hand-made look.</strong> One coloured-pencil illustration style for Luna and every scene, chosen to make an AI product feel warm and human.</li>
          </ul>
          <p>Onboarding went through three versions in about two weeks. After an internal review of version one, we reworked eleven points, each decided by our designer, which led to the read-along paywall in version three.</p>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-coral" aria-labelledby="numbers-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="numbers-title" data-split>The work in numbers</h2>
      </div>
      <div class="stats" data-reveal-group>
        <div class="stat" data-reveal><span class="stat__num">6</span><p>user flows specced, from onboarding to profile</p></div>
        <div class="stat" data-reveal><span class="stat__num">137</span><p>design tokens (Figma variables) in the design system</p></div>
        <div class="stat" data-reveal><span class="stat__num">96</span><p>component variants across 17 atoms, plus 13 molecules</p></div>
        <div class="stat" data-reveal><span class="stat__num">3</span><p>clickable onboarding prototypes in about two weeks</p></div>
      </div>
    </div>
  </section>

  <section class="section scheme-dark" aria-labelledby="ai-title">
    <div class="container ai-def">
      <h2 class="h2" id="ai-title" data-split>Where AI helped</h2>
      <div class="text-lg prose" data-reveal>
        <ul>
          <li><strong>Research to brief in a week.</strong> An AI research workflow synthesised the market, competitors and personas; Claude Code helped shape the MVP brief. Our designer ranked 28 features and set the MVP scope.</li>
          <li><strong>Illustration with Nano Banana (Gemini).</strong> About 12 Luna poses, scenes and cards, all generated image-to-image from one approved base, so the style never drifts. Our designer picked from candidates and approved every asset.</li>
          <li><strong>Asset QA with Claude Code.</strong> An automated transparency check caught two overlays with baked-in checkerboard backgrounds before they reached the app.</li>
          <li><strong>Figma built through Claude Code and the Figma MCP</strong>, from the written flow specs. Our designer designed every screen, reviewed the output and corrected it.</li>
        </ul>
        <p>See how this works on every project: <a class="text-link" href="/ai-design/">how we design with AI</a>.</p>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="outcome-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="outcome-title" data-split>What came out of it</h2>
        <div class="text-lg prose" data-reveal>
          <p>The client's developers built the app straight from the Figma file, with the version-three onboarding, and Lula has been on the App Store since September 2026.</p>
          <p>It is designed to feel hand-made in a crowded AI category, to let parents hear a story starring their child before they pay, and to keep parents in charge of what the AI tells their children.</p>
          <p>Before the app, we also designed and built its pre-launch waitlist page: <a class="text-link" href="/work/tales-ai-landing/">see the Tales AI landing page</a>.</p>
        </div>
      </div>
      <div class="phones" data-reveal-group>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/07_1b-720.webp" srcset="/assets/img/work/lula/07_1b-360.webp 360w, /assets/img/work/lula/07_1b-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Luna introduces herself as the child's bedtime friend." loading="lazy"><figcaption>Luna introduces herself.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/17_s8-720.webp" srcset="/assets/img/work/lula/17_s8-360.webp 360w, /assets/img/work/lula/17_s8-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Choice of narrator: you in your voice, or Luna in her voice." loading="lazy"><figcaption>Your voice, or Luna's.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/lula/23_s8b-720.webp" srcset="/assets/img/work/lula/23_s8b-360.webp 360w, /assets/img/work/lula/23_s8b-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="780" alt="Voice recording screen with a short passage to read aloud and a record button." loading="lazy"><figcaption>One short reading clones the voice.</figcaption></figure>
      </div>
    </div>
  </section>

  {{> work-next}}
</main>
{{> footer}}
