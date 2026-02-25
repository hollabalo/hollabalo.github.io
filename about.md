---
title: About / Resume
layout: default
permalink: /about
published: true
---
## General Tidbits

Hello. Thank you for your interest.

First off, **JM** means John Michael. I'm a Solutions Architect and Backend Developer based in Manila, Philippines, with a strong focus on serverless architectures, containerization, and CI/CD automation.

I have more than a decade of experience in software development, system design, and engineering management. Fintech, telco, and banking are the domains I've worked in extensively.

I currently work as a **Master Software Engineer** at GCash (Mynt — Globe Fintech Innovations, Inc.), one of the Philippines' top digital finance platforms, where I contribute to platform engineering and cloud-native architecture within the GC Solutions organization. I also had a people management stint as Domain Lead overseeing a cross-functional engineering team.

To check out some of my notable projects (details may be redacted due to NDA), see the [projects](/projects) section.

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

- **AWS Certified Solutions Architect – Associate**
- **Certified Kubernetes Application Developer (CKAD)**
- **Kubernetes and Cloud Native Associate (KCNA)**

</div>

## Education
<div class="education-item">

**Adamson University** — Manila, Philippines<br>
Bachelor of Science in Computer Science

</div>
