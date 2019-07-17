---
layout: post
title: Personalized Suggestions — Odysseus Development Blog
posttitle: Personalized Suggestions
header: 17th July 2019  — Adrian Cochrane
date: 2019-07-17 19:55:23 1200
categories: dev
---

A new Odysseus update is out supporting personalized link suggestions, so why is this important? And how does it work?

## Why?
Web surfers frequently turn to the "hueristics"<sup title="The media usually say 'algorithm', but I reckon that term implies more accuracy then is waranted">1</sup> of major sites like YouTube or Facebook in order to fill their time. The problem is that these sites [do not](http://meta.ath0.com/2019/01/www-what-went-wrong/) have your best interests at heart: they want to keep you in their site and need to surveil your browser history in order to compute these recommendations.

Your web browser (ideally) only wants to help get the best out of The Web, and it inherently has access to your browser history. As such it's in the perfect position to provide you these recommendations.

## How?
Recommendations engines ask the question "what new page is most similar to the pages you've already visited?" Odysseus takes the approach of considering the links on a page as a pointer to similar pages, and as such the personalized recommendations engine is as simple as collecting unvisited links on all the pages you visit. For it to later echo these links back as personalized recommendations, entirely in the privacy of your own computer.

Each time you visit a page the score of all the pages it links to will be incremented. Revisiting will count extra towards it's links, as per any external links.

The goal was to keep this solution simple enough for the layperson to understand how it's impacting them. I think I achieved that, but I haven't seen it recommend any links to me yet.

---

1. The media usually say "algorithm", but I reckon that term implies more accuracy then is waranted
