<header class="nav" data-nav lang="en">
  <div class="nav__inner">
    <div class="nav__brand">
      <a class="nav__logo" href="/" aria-label="Libre Studio, home"><img src="/assets/img/figma/libre-logo-light.svg" alt="" width="85" height="14"></a>
    </div>
    <nav class="nav__links" aria-label="Main">
      <a class="nav__link" href="/#services">Services</a>
      <a class="nav__link" href="/#projects">Projects</a>
      <a class="nav__link" href="/careers/"{{current:careers}}>Careers</a>
    </nav>
    <div class="nav__actions">
      <a class="btn btn--lime btn--sm" href="{{calendar}}" target="_blank" rel="noopener"><span class="btn__label"><span data-text="Book a Call">Book a Call</span></span></a>
      <button class="nav__toggle" type="button" aria-expanded="false" aria-controls="nav-panel" aria-label="Open menu" data-nav-toggle><span></span><span></span></button>
    </div>
  </div>
  <div class="nav__panel" id="nav-panel" data-nav-panel>
    <ul data-stagger>
      <li><a href="/#services">Services</a></li>
      <li><a href="/#projects">Projects</a></li>
      <li><a href="/careers/"{{current:careers}}>Careers</a></li>
      <li><a href="/careers/apply/"{{current:apply}}>Apply</a></li>
    </ul>
    <a class="btn btn--lime" href="{{calendar}}" target="_blank" rel="noopener">Book a Call</a>
  </div>
</header>
