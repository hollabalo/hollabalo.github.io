---
layout: home
permalink: /
published: true
---

<section class="hero">
  <div class="hero-avatar">JG</div>
  <div class="hero-info">
    <h1>JM Gerona</h1>
    <p class="hero-role">
      <span class="hero-prompt">❯</span>
      Solutions Architect
      <span class="hero-at">@</span>
      GCash / Mynt
    </p>
    <p class="hero-location"><i class="fas fa-map-marker-alt"></i>&nbsp; Taguig City, Metro Manila, Philippines</p>
    <p class="hero-bio">
      Hands-on Solutions Architect with 13+ years of Java/Spring Boot experience building large-scale fintech platforms.
      Currently architecting high-availability systems for GCash using Kafka, Kubernetes, AWS, and Alibaba Cloud.
      AWS Solutions Architect certified, CKAD, and KCNA.
    </p>
    <div class="hero-links">
      <a class="hero-link-btn" href="https://www.linkedin.com/in/jmdgerona" target="_blank">
        <i class="fab fa-linkedin"></i> LinkedIn
      </a>
      <a class="hero-link-btn" href="https://www.github.com/jmgerona" target="_blank">
        <i class="fab fa-github"></i> GitHub
      </a>
      <a class="hero-link-btn" href="https://stackoverflow.com/users/makalshrek" target="_blank">
        <i class="fab fa-stack-overflow"></i> Stack Overflow
      </a>
      <a class="hero-link-btn hero-link-primary" href="/about/">View Resume &rarr;</a>
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
  <h2 class="section-heading">Featured Projects</h2>
  <div class="projects-grid">
    {% assign featured = site.projects | where: "featured", true %}
    {% if featured.size == 0 %}{% assign featured = site.projects %}{% endif %}
    {% for project in featured limit: 3 %}
      <div class="project-card">
        {% if project.redirect %}
          <a href="{{ project.redirect }}" target="_blank">
        {% else %}
          <a href="{{ project.url | prepend: site.baseurl }}">
        {% endif %}
          <h3>{{ project.title }}</h3>
          <p>{{ project.description }}</p>
        </a>
      </div>
    {% endfor %}
  </div>
  <a class="see-all-link" href="{{ site.baseurl }}/projects/">All projects &rarr;</a>
</section>

<section class="featured-section">
  <h2 class="section-heading">Recent Articles</h2>
  {% for post in site.posts limit: 3 %}
    <div class="article-preview">
      <span class="article-date">{{ post.date | date: "%b %Y" }}</span>
      <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </div>
  {% else %}
    <p class="certification-item">No articles yet &mdash; stay tuned.</p>
  {% endfor %}
  <a class="see-all-link" href="{{ site.baseurl }}/blog/">All articles &rarr;</a>
</section>
