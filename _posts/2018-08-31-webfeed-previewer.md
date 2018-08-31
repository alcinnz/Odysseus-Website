---
layout: post
title: Webfeed Previewer — Odysseus Development Blog
posttitle: Webfeed Previewer
header: 31st August 2018 — Adrian Cochrane
date: 2018-08-31 19:25:57 1200
categories: dev
---

A new Odysseus update is being currently being released with support for previewing webfeeds. As well as some fixes so it still works on the latest WebKit.

What's a webfeed? A webfeed (also known as RSS) allows you to aggregate all updates to various sites and view them in a single usually chronological timeline. You may use so-called "social networks" to do this today, but webfeeds are simpler, more effective, and more transparant.

Because Despite the rumours of webfeed's demise after Google Reader was killed, it is still in very heavy use. Most websites still provide webfeeds, and while it's not as strong as when webfeeds got prime real-estate in mainstream browser chrome lots of people still rely on webfeeds.

Because the alternatives are either to waste your time rechecking sites again and again for updates or for those sites to all send those updates to a central service to aggregate those changes. Both of which are far too common of actions amongst websurfers today. And the latter of which sounds exactly like what I'm trying to avoid when I use the term "open web", i.e. I want an equal playing field for all voices and sites online. It is for these reasons it is vital for web browsers to [once again](https://ar.al/2018/06/29/reclaiming-rss/) to give webfeeds prime real-estate.

Also everything I'm doing here is practice for later work I want to do with websearch.

## Implementation

When you visit a webfeed, it detects that it's of a known filetype and if so hands it off to a template (written in Odysseus's good-old Prosody Templating Language). This template will then download the webfeed (or in the future, other formats will be handled similarly) and dispatch it's rendering to another template for that mimetype.

For now this will ultimately (unless it's an XML file I initially mistook for a webfeed) be dispatched to a single template for webfeeds. Which will render almost all the data from the webfeed into a nicely formatted HTML file webkit can handle.

### XML Support in Prosody

The biggest chunk of work in making this function was to add support for XML to Prosody's HTTP(S) client. And to test this code, to Prosody's test runner. As such my templates will barely need to worry about whether it gets a response formatted using JSON or XML syntax, because it really doesn't matter which you use for your sites. (I didn't like those debates I heard amongst uni classmates)

Or viewed a different way, every feed reader I've read the code for serializes it's XML into an array as a light-weight abstraction over the non-idiomatic way RSS structure XML. A nuisance that was only made worse when the IETF standardized an alternative that was structured idiomatically, because now we need to ignore XML namespaces.

#### Handling text content

A neat feature of Atom webfeeds is that you can specify whether an element's content is formatted as `text` (no formatting), (XML-escaped) `html`, or `xhtml`. This feature was implemented in the XML-bindings, and required me to add a way for input data to bypass the autoescaping applied by Prosody. Once that change was made it became easy to implement this, though for cleanliness and possibly security I needed to perform some sanity-checks on the parsed (X)HTML.

### Filtering displayed posts

One neat feature of this webfeed template is that allows you to filter displayed posts by author or tag (or in RSS terminology "subject"). To implement this I extended Prosody's data model, and exposed the extension through a new "data filter". This also gave the XML bindings a chance to hide another difference between RSS and Atom.

To be specific, Prosody data can now be coerced to an ordered set of strings, which behind-the-scenes is implemented using LibGee's O(log n) performant [TreeSet](https://valadoc.org/gee-0.8/Gee.TreeSet.html). This both serves to gather available tags to be displayed in the sidebar, and to test whether an item is in the search.

### Other Prosody extensions

The new features to Prosody required by this webfeed support don't stop there! It now has the ability to:

* Render one template into another. This is used what's used to run the webfeed template.
* Traverse some given data looking for all occurences of a given key. This meaning's *slightly* different for XML.
* Keep only the items in a collection which pass a given filter expression.
* MD5 hash a string
* Reformate relative links into absolute links.

## What's next?

Tomorrow I'll do some requested work on Odysseus regarding packaging it for other free desktops, and once again fixing the performance of it's topsites page.

But hopefully that work won't take long and I'll be able to get back to finishing up implementing webfeeds for Odysseus. Specifically the most important bit: actually subscribing to feeds!

P.S. It may be hard to notice in most browsers anymore, but this blog now has a [webfeed](/Odysseues/feed.atom). Try it out!
