---
title: my resume
layout: default
permalink: /about
published: true
---
## General Tidbits
Hello. Thank you for your interest.

First off, JM means John Michael. I'm a senior software engineer based in Manila, Philippines.

I have more than a decade of experience on software development, system maintenance, and management. Fin-tech, telco, 
and banking are the domains I have extensively worked on.

I currently work as a Java backend engineer for a top fintech company. But I had some people management stint as well.
 
To check out some of my notable projects (details probably redacted due to NDA), check the [projects](/projects) section.

***

## Work Experience
<div class="ResumeContainer">
{% for experience in site.experiences reversed %}
   {% if experience.visible == true %}
        <div class="experience-item">
            <h3 class="company">{{ experience.company }}</h3>
            <h4 class="description">{{ experience.position }} &#124; <span>{{ experience.duration }}</span></h4>
            <div class="details">{{ experience.content }}</div>
        </div>
      {% unless forloop.last %} {% endunless %}
   {% endif %}
{% endfor %}
</div>
 
## Certifications
<div class="certification-item">
None
</div>

## Education
<div class="education-item">
    Adamson
</div>