---
layout: page
title: Adding a webfeed — Developers — Odysseus
header: Adding a webfeed
---

# Adding a webfeed to your site
A webfeed (aka RSS, Atom, podcasts, etc) is a great way to offer your readers continual value, by notifying them of any updates to your website. Odysseus makes it easy for those visitors to take advantage of that extra value, and this page documents how to take advantage of it.

To find your webfeed Odysseus scans the first 2KB of your page for a `<link rel="alternate">` element. If it finds one or more, Odysseus shows a "subscribe" button in it's addressbar. Once the button's clicked, Odysseus downloads those webfeeds to verify that they have a MIMEtype of `application/atom+xml`, `application/rss+xml`, `text/xml`, or `application/xml` and determine presentation details.

Additionally (or alternately) you may add `<a>` links (typically indicated using an icon like ![webfeed icon](https://en.wikipedia.org/wiki/RSS)) to your webfeeds on your webpage, which in Odysseus will take you to a different page rendering a nice preview of your webfeed where your visitors can then subscribe. While this doesn't present near as nicely in Odysseus, it does help visitors using browsers that do not support webfeed autodiscovery and you should do it.

## Creating a webfeed
If you're using any blogging engine or Content Management System your site probably already provides webfeeds. If you're using a webframework it may include helpers you can call to generate your webfeeds. In either case I recommend you look up the relevant documentation for your tool.

Or if you're writing your webpage by hand, webfeeds are very easy to author with the main challenge being keeping them up to date. I would recommend you read [the Atom standard](https://tools.ietf.org/html/rfc4287), and if you want paging there's a backwards-compatible [standard for that](https://tools.ietf.org/html/rfc5005). Though as mentioned [RSS](https://cyber.harvard.edu/rss/rss.html) is supported as well.
