---
layout: home
permalink: /
published: true
---

<section class="hero">
  <div class="hero-avatar">JG</div>
  <div class="hero-info">
    <h1>JM</h1>
    <p class="hero-role">
      <span class="hero-prompt">❯</span>
      Solutions Architect
    </p>
    <p class="hero-location"><i class="fas fa-map-marker-alt"></i>&nbsp; Taguig City, Metro Manila, Philippines</p>
    <p class="hero-bio">
      Hey, I'm JM — a Solutions Architect with a decade-plus of software engineering
      under my belt, working across fintech, banking, and telco. I started out as a software
      engineer, grew into senior engineering roles, and now focus on designing
      distributed systems and event-driven architecture. I'm AWS SAA, CKAD, and KCNA
      certified. On weekends I tinker with Serverless projects in Node.js.
    </p>
    <div class="hero-links">
      <a class="hero-link-btn" href="https://www.linkedin.com/in/jmdgerona" target="_blank">
        <i class="fab fa-linkedin"></i> LinkedIn
      </a>
      <a class="hero-link-btn" href="https://www.github.com/jmgerona" target="_blank">
        <i class="fab fa-github"></i> GitHub
      </a>
      <a class="hero-link-btn" href="https://stackoverflow.com/users/hollabaloo" target="_blank">
        <i class="fab fa-stack-overflow"></i> Stack Overflow
      </a>
      <a class="hero-link-btn hero-link-primary" href="/about/">About Me</a>
      <a class="hero-link-btn" href="/cv/">View CV &rarr;</a>
    </div>
  </div>
</section>

<section class="skills-section">
  <div class="skills-strip">
    {% assign all_skills = site.skills.languages | concat: site.skills.architecture | concat: site.skills.cloud | concat: site.skills.frameworks | concat: site.skills.tools %}
    {% for skill in all_skills %}
      <span class="skill-tag">{{ skill }}</span>
    {% endfor %}
  </div>
</section>

<section class="featured-section">
  <h2 class="section-heading">Recent Articles</h2>
  {% for post in site.posts limit: 5 %}
    <div class="article-preview">
      <span class="article-date">{{ post.date | date: "%b %Y" }}</span>
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </div>
  {% else %}
    <p class="certification-item">No articles yet &mdash; stay tuned.</p>
  {% endfor %}
  <a class="see-all-link" href="{{ site.baseurl }}/blog/">All articles &rarr;</a>
</section>
