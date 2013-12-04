---
layout: default
title: What Can I Do - For My Company?
permalink: /ICan/ForMyCompany/
---

{% for weight in (1..10) %}
  {% for post in site.posts %}
      {% if post.category == "formycompany" %}
        {% if post.weight == weight %}
<p>
    <div class="clear"></div>
    <div class="grid_3">
        <img src="{{ post.image }}" width="214px"/>
    </div>
    <div class="grid_6">
        <h1>{{ post.title }}</h1>
        <h2>{{ post.subtitle }}</h2>
        {{ post.content }}
    </div>
</p>
<div class="clear"></div>
<br>
        {% endif %}
      {% endif %}
  {% endfor %}
{% endfor %}