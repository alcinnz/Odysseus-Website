---
layout: page
title: Integrating your feedreader — Developers — Odysseus
header: Integrating your feedreader
---
# Integrating your feedreader into Odysseus
Do you really want people to have to copy and paste URLs into your feedreader? If not, Odysseus offers you a simple integration point based on [existing standards](https://www.freedesktop.org/wiki/Specifications/desktop-entry-spec/).

Just advertise support for opening `application/atom+xml` and `application/rss+xml` URLs and Odysseus will show a button for your app next to each webfeed it has found. Where opening one of these URLs should be interpreted as subscribing to it. Furthermore if no supported apps are installed and the underlying OS supports it, Odysseus will suggest users to install your app.

If you want to control whether your app shows up next to any given feed, you can add the `X-WebFeed-Type` key to your `.desktop` file. If this key is "`none`" it won't ever show up. Otherwise it should list some semicolon-seperated (`;`) MIMEtypes, requiring a webfeed to have an attachment (`<enclosure>` for Atom, `<content>` for RSS) with one of those `type`s in order for that feed to be subscribed to via your app. This non-standard key is not required by Odysseus.
