---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags-container">
  <h1>All Tags</h1>

  <div class="tags-cloud">
    {% assign tags = site.tags | sort %}
    {% for tag in tags %}
      <a href="#{{ tag[0] | slugify }}" class="tag-link">{{ tag[0] }}</a>
    {% endfor %}
  </div>

  <div class="tags-list">
    {% assign tags = site.tags | sort %}
    {% for tag in tags %}
      <h3 id="{{ tag[0] | slugify }}">{{ tag[0] }}</h3>
      <ul class="tag-posts">
        {% assign sorted_posts = tag[1] | sort: 'date' | reverse %}
        {% for post in sorted_posts %}
          <li>
            <span class="post-date">{{ post.date | date: "%b %d, %Y" }}</span>
            <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
          </li>
        {% endfor %}
      </ul>
    {% endfor %}
  </div>
</div>

<style>
.tags-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
}

.tags-cloud {
  margin-bottom: 2rem;
}

.tag-link {
  display: inline-block;
  background: #f0f0f0;
  color: #333;
  padding: 0.5rem 1rem;
  margin: 0.25rem;
  border-radius: 20px;
  text-decoration: none;
  font-size: 0.9rem;
  transition: background-color 0.2s;
}

.tag-link:hover {
  background: #007acc;
  color: white;
}

.tags-list h3 {
  border-bottom: 2px solid #007acc;
  padding-bottom: 0.5rem;
  margin-top: 2rem;
  margin-bottom: 1rem;
}

.tag-posts {
  list-style: none;
  padding: 0;
}

.tag-posts li {
  margin-bottom: 0.5rem;
  padding: 0.5rem 0;
  border-bottom: 1px solid #eee;
}

.post-date {
  color: #666;
  font-size: 0.9rem;
  margin-right: 1rem;
}
</style>
