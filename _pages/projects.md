---
title: Projects
layout: default
permalink: /projects/
published: true
---

<h2 class="section-heading">Projects</h2>
<p class="certification-item" style="margin-bottom:1.5em;">A selection of work &mdash; some details redacted under NDA.</p>

<div class="ProjectContainer">
  <div class="gallery">
    {% for project in site.projects %}
      {% if project.redirect %}
        <div class="projectTile">
          <a href="{{ project.redirect }}" target="_blank">
            <span>
              <h2>{{ project.title }}</h2>
              <p>{{ project.description }}</p>
            </span>
          </a>
        </div>
      {% else %}
        <div class="projectTile">
          <a href="{{ project.url | prepend: site.baseurl }}">
            <span>
              <h2>{{ project.title }}</h2>
              <p>{{ project.description }}</p>
            </span>
          </a>
        </div>
      {% endif %}
    {% endfor %}
  </div>
</div>
