---
layout: page
title: "Repost: Web engines in Haskell — Odysseus Development Blog"
posttitle: "Repost: Web engines in Haskell"
header: 31st May 2019 — Adrian Cochrane
date: 2019-05-31 15:12:23 1200
categories: repost
---

# [Web engines in Haskell](https://chrisdone.com/posts/web-engines/)
The collapse of browser engine diversity has been very concerning to me as a browser developer. I rely on it to keep the Web cross-platform, and as such I'm pleased to see developers like Chris exploring the feasability of reimplementing a subset of the web platform. My own attempt wasn't near as successful, possibly because I knew too much about how existing browser engines work.

It seems clear to me that in order to survive the Web *needs* to be forked. We need to deprecate most of the web standards and treat anything beyond basic HTML as an enhancement rather than something to rely on. WHATWG won't do it now that they have [full custody](https://www.zdnet.com/article/browser-vendors-win-war-with-w3c-over-html-and-dom-standards/) of the HTML/DOM standards. Maybe we should even [extend HTML](https://git.nzoss.org.nz/html6) to support things we'd have lost from dropping JavaScript.

By doing so not only would developing browsers become easier but so would web pages, and we should have privacy, security, and accessibility benefits. Because with webpages explicitly requesting behaviour from the browser, rather than describing how to achieve it, the browser can exercise more control over those pages on behalf of the user.

And most importantly browsers shouldn't feel like they need to support everything, they need to embrace native apps to lighten their taskload [like Odysseus does](https://odysseus.adrian.geek.nz/design/2018/06/02/app-suggestions.html).

## Haskell
I would note that Haskell seems like a very good choice for a browser engine. Browsers tend to be very compute heavy and full of parsers and tree processing, which are all areas were functional languages like Haskell shines.
