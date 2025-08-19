---
layout: post
title:  "Articles"
date:   2025-08-15 16:25:31 +0100
categories: jekyll update
permalink: /articles
---

# Test


<!-- <div class="post-list"> -->
<!--   <p> -->
<!--     Mostly tech. <a href="/feed.xml">Subscribe</a> through RSS. -->
<!--   </p> -->

<!--   <ul class="posts"> -->
<!--     {% for page in site.articles._posts %} -->
<!--       <li> -->
<!--         <a href="{{ page.url }}"> -->
<!--           {{ page.title }} -->
<!--         </a> -->
<!--         <div class="info"> -->
<!--           <span class="date"> -->
<!--             {{ page.date | date: "%-d %B, %Y" }} -->
<!--           </span> -->
<!--           &middot; -->
<!--           <span class="summary"> -->
<!--             {{ page.summary }} -->
<!--           </span> -->
<!--         </div> -->
<!--       </li> -->
<!--     {% endfor %} -->
<!--   </ul> -->
<!-- </div> -->


<ul>
  {% for post in site.articles%}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
