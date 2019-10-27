---
layout: page
title: Web Bloat — Developers — Odysseus
header: Web Bloat
---

**NOTE:** Not everyone I link to here agree with me.

## Addressing Web Bloat for WebDevs
[Browser engine divirsity](https://css-tricks.com/the-ecological-impact-of-browser-diversity/) has been [collapsing](https://blog.mozilla.org/blog/2018/12/06/goodbye-edge/), and I blame even the fact we're worrying about this on the sheer complexity of modern browser engines. Which gets entrenched thanks to webdevs embracing all the features of mainstream browser engines.

This article advises concerned webdevs how to address these [issues](https://www.devever.net/~hl/xhtml2) in their everyday work.

### 1. Test in Multiple Browsers
If you do nothing else, *always* make sure your sites work in multiple browsers. Because any time one of your sites break outside of Google Chrome you're contributing to a Google monopoly.

At a minimum you should be testing against the [Blink](https://www.chromium.org/blink), [Gecko](https://hg.mozilla.org/mozilla-central/), and [WebKit](https://webkit.org/) browser engines, which essentially means [Chrome](https://www.google.com/chrome/), [Firefox](https://www.mozilla.org/en-US/firefox/new/), and [Odysseus](https://odysseus.adrian.geek.nz/)/[Midori](https://www.midori-browser.org/)/[Epiphany](https://wiki.gnome.org/Apps/Web)/[Safari](https://www.apple.com/safari/)/etc. For the latter you'll probably need a Mac or (my recommendation) "Linux" system on hand.

Though I would also recommend testing in less mainstream browsers like [Lynx](https://lynx.browser.org/), [Dillo](https://www.dillo.org/), [NetSurf](http://www.netsurf-browser.org/), and my own [Rhapsode](https://git.nzoss.org.nz/alcinnz/rhapsode). In doing so don't worry that your sites will look different in these browsers, just that they still look good.

### 2. Use Progressive Enhancement
[Progressive](https://www.smashingmagazine.com/2009/04/progressive-enhancement-what-it-is-and-how-to-use-it/) [Enhancement](https://alistapart.com/article/understandingprogressiveenhancement/) is the idea that you should start with the raw functionality before adding layers of optional polish. With each successive layer benefitting slightly fewer people.

In terms of web design these layers most coursely are:

1. Text - works practically everywhere.
2. HTML
3. CSS
4. Images, videos, etc
5. JavaScript - will likely fail, be ill-suited to the target device, or (accessibility) not be perceivable by the user.

This is vital for the emergence of new browser engines, and even novel displays, because none of them will support every web feature out of the box. By not requiring feature completeness to view pages you can allow these engines to grow. You're not on your own though, a certain level of graceful degradation (the flipside of progressive enhancement) is carefully woven throughout the HTML and CSS standards.

### 3. Avoid JavaScript
This has already been my most controversial prescription, but for the sake of [privacy](https://media.libreplanet.org/u/libreplanet/m/who-s-afraid-of-spectre-and-meltdown/), [security](https://mdsattacks.com/#accordion-tab-1-heading-11), and accessibility (discussed later) I stand by it.

It seems clear that no new JavaScript engine can hope to catch up to the mainstream ones in terms of performance or API support, as such we should not expect them to. We should instead see how well recent web standards allow us to do without JavaScript, and failing that we should discuss [how new web standards](http://john.ankarstrom.se/replacing-javascript/) can help us move further away from JavaScript. Along that line I encourage you to check out [Intercooler.js](http://intercoolerjs.org/) or [Unpoly.js](https://unpoly.com/).

#### Examples

* [Pelican](https://mcss.mosra.cz/themes/pelican/)
* [A JavaScript-Free Frontend](https://dev.to/winduptoy/a-javascript-free-frontend-2d3e) (blogpost)

### 4. Learn "Native" Toolkits
The fundamental driver of browser bloat as I see it is a belief that the Web's hyperlinks, openness, and "universality" (the idea that it works great everywhere) means everything should be on the web. I disagree that these concepts have much meaning when applied outside of information, just as I disagree with the lack of design focus.

I encourage you to [consider](https://www.smashingmagazine.com/2012/06/mobile-considerations-in-user-experience-design-web-or-native/) whether your project is better suited as a website or as a native app. Maybe you'll want to excell on a particular platform or maybe you'll want to create a decent app for a range of platforms, these are decisions you need to make. My rule of thumb for choosing web vs native is whether it'll more be information or behavior which attracts users.

### 5. Provide Downloads & Use `mailto:`, Etc Links
Currently if your information doesn't degrade nicely to static text or images (e.g. maps, video games, instant messaging, etc), we feel a need to create a JavaScript UI for it so it can be linked to. I can't honestly tell you to stop doing this, but I think we should transition to a better way of addressing these needs.

Most platforms allow apps to register to handle specific MIMEtypes and URI schemes, and most browsers will dispatch links they can't handle accordingly. Handling more disperate communication needs this way is a much better way to distribute and coordinate the development effort.

The problem is that the apps usually need to be already installed in order for the links to work, but [I've addressed this](https://odysseus.adrian.geek.nz/design/2018/06/02/app-suggestions.html) in Odysseus by helping people to install compatible apps using the AppStream standards. More browsers should adopt this feature!
