---
layout: page
title: Web Bloat — Developers — Odysseus
header: Web Bloat
---

**NOTE:** Not everyone I link to here agree with me.

## Addressing Web Bloat for WebDevs
[Browser engine divirsity](https://css-tricks.com/the-ecological-impact-of-browser-diversity/) has been [collapsing](https://blog.mozilla.org/blog/2018/12/06/goodbye-edge/), and I blame even the fact we're worrying about this on the sheer complexity of modern browser engines. Which gets entrenched thanks to webdevs embracing all the features of mainstream browser engines.

This article advises concerned webdevs how to address these issues in their everyday work.

### 1. Test in Multiple Browsers
If you do nothing else, *always* make sure your sites work in multiple browsers. Because any time one of your sites break outside of Google Chrome you're contributing to a Google monopoly.

At a minimum you should be testing against the [Blink](https://www.chromium.org/blink), [Gecko](https://hg.mozilla.org/mozilla-central/), and [WebKit](https://webkit.org/) browser engines, which essentially means [Chrome](https://www.google.com/chrome/), [Firefox](https://www.mozilla.org/en-US/firefox/new/), and [Odysseus](https://odysseus.adrian.geek.nz/)/[Midori](https://www.midori-browser.org/)/[Epiphany](https://wiki.gnome.org/Apps/Web)/[Safari](https://www.apple.com/safari/)/etc. For the latter you'll probably need a Mac or (my recommendation) "Linux" system on hand.

Though I would also recommend testing in less mainstream browsers like [Lynx](https://lynx.browser.org/) and [NetSurf](http://www.netsurf-browser.org/).
