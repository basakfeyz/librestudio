<!--page {"title": "MONA AI: Photo & Video Studio, UI/UX and Motion Case Study · Libre Studio", "description": "How we designed MONA AI, an AI photo and video studio app, end to end: a style-first explore screen, photo guidance before upload, and an animated splash made with Kling AI.", "path": "/work/mona-ai/", "nav": "work"} -->
{{> head}}
{{> nav}}
<main id="main">

  <section class="section hero scheme-dark case-hero" aria-labelledby="case-title">
    <div class="container hero__inner">
      <div class="hero__copy">
        <div class="stack">
          <p class="eyebrow" data-reveal>Case study · Mobile app</p>
          <h1 class="h1" id="case-title" data-split>MONA AI: your face, 500+ <span class="mark">styles<svg class="mark__svg" viewBox="0 0 240 24" preserveAspectRatio="none" aria-hidden="true" focusable="false" data-draw><path d="M4 15 C 46 8, 92 19, 136 12 S 210 7, 236 13"/></svg></span></h1>
          <p class="text-lg" data-reveal>An AI photo and video studio: upload a selfie, pick a style, get a portrait, a headshot or a short video. We designed it end to end, including the motion.</p>
        </div>
      </div>
      <dl class="facts" data-reveal>
        <div><dt>Client</dt><dd>Horus Studios</dd></div>
        <div><dt>Our role</dt><dd>End-to-end UI/UX design and motion</dd></div>
        <div><dt>Platform</dt><dd>iOS</dd></div>
        <div><dt>Status</dt><dd><a class="text-link" href="https://apps.apple.com/tr/app/mona-ai-photo-video-studio/id6761020447" target="_blank" rel="noopener">On the App Store</a> since April 2026</dd></div>
      </dl>
    </div>
  </section>

  <section class="section scheme-light" aria-label="App screens">
    <div class="container">
      <div class="phones" data-reveal-group>
        <figure class="phone" data-reveal><img src="/assets/img/work/mona/m6-720.webp" srcset="/assets/img/work/mona/m6-360.webp 360w, /assets/img/work/mona/m6-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="778" alt="Explore screen: a featured style carousel above a grid of style cards such as Birthday Glam, Professional Photoshoot, Street Soul and YOUphoria." loading="lazy"><figcaption>Explore: styles first, one tap to try.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/mona/m123-720.webp" srcset="/assets/img/work/mona/m123-360.webp 360w, /assets/img/work/mona/m123-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="778" alt="Paywall: Create your first AI photos today, with a first-week offer and what premium includes." loading="lazy"><figcaption>A paywall that sells the first result.</figcaption></figure>
        <figure class="phone" data-reveal><img src="/assets/img/work/mona/m135-720.webp" srcset="/assets/img/work/mona/m135-360.webp 360w, /assets/img/work/mona/m135-720.webp 720w" sizes="(min-width: 992px) 300px, 45vw" width="360" height="778" alt="Profile screen with a Create more with Premium card showing weekly credits." loading="lazy"><figcaption>Credits and premium, kept in plain words.</figcaption></figure>
      </div>
    </div>
  </section>

  <section class="section scheme-light" aria-labelledby="problem-title">
    <div class="container split-rows">
      <div class="ai-def">
        <h2 class="h2" id="problem-title" data-split>The problem</h2>
        <div class="text-lg prose" data-reveal>
          <p>An AI photo app lives or dies on one loop: hand over a selfie, get back something you want to share. Every step that slows the loop, or produces a result that doesn't look like you, costs a user.</p>
        </div>
      </div>
      <div class="ai-def">
        <h2 class="h2" id="did-title" data-split>What we did</h2>
        <div class="text-lg prose" data-reveal>
          <ul>
            <li><strong>Styles first.</strong> The explore screen leads with what you could become, not with settings: a featured carousel, then style cards, each one tap from trying it.</li>
            <li><strong>Guidance before upload.</strong> Photo guidelines show good and bad photos side by side before you choose one, because a better input is the cheapest way to a better result.</li>
            <li><strong>Photo and video in one place</strong>, with results saved to My Media, ready to share, recreate or edit.</li>
            <li><strong>A paywall that sells the first result</strong>, and a premium card that explains credits in plain words.</li>
            <li><strong>Motion for the brand.</strong> An animated splash where golden shards assemble into the MONA logo.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <section class="section scheme-dark" aria-labelledby="ai-title">
    <div class="container ai-def">
      <h2 class="h2" id="ai-title" data-split>Where AI helped</h2>
      <div class="text-lg prose" data-reveal>
        <ul>
          <li><strong>Kling AI for the splash.</strong> Image-to-video from the real logo file, so the final frame is exactly the MONA mark, with the motion directed in a written prompt.</li>
          <li><strong>A coded animation for the app.</strong> The logo transformation was also delivered as a ready React Native component, so developers could drop it in instead of rebuilding it from a video.</li>
        </ul>
        <p>See how this works on every project: <a class="text-link" href="/ai-design/">how we design with AI</a>.</p>
      </div>
    </div>
  </section>

  <section class="section scheme-coral" aria-labelledby="numbers-title">
    <div class="container">
      <div class="section-title narrow">
        <h2 class="h2" id="numbers-title" data-split>What came out of it</h2>
        <p class="text-lg" data-reveal>MONA AI launched on the App Store in April 2026 and has kept shipping since.</p>
      </div>
      <div class="stats stats--3" data-reveal-group>
        <div class="stat" data-reveal><span class="stat__num">5.0</span><p>App Store rating, from 27 ratings (Turkey store, October 2026)</p></div>
        <div class="stat" data-reveal><span class="stat__num">8</span><p>releases between April and October 2026, up to version 3.0</p></div>
        <div class="stat" data-reveal><span class="stat__num">500+</span><p>styles across photo and video</p></div>
      </div>
    </div>
  </section>

  {{> work-next}}
</main>
{{> footer}}
