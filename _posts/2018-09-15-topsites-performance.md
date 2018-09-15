---
layout: post
title: Topsites Performance — Odysseus Development Blog
posttitle: Topsites Performance
header: 15th Sept 2018 — Adrian Cochrane
date: 2018-09-15 19:49:42 1200
categories: dev
---

I've been experiencing some performance problems with Odysseus's [topsites](odysseus:home) display, and I hear so have some of you. So overtime I have been adding performance improvements to it, and I may continue to do so. In this post I will document what these have been, what these may be.

## Original Situation
The topsites display is an SQLite query (which is the same technology as behind elementary Music's "smart playlists"), which is rendered to HTML using a custom templating language I call "Prosody". However it turns out this required the number of visits to each page to be visited before it can compute which links to show, which in turn manifests as a freeze as you use Odysseus more.

On the otherhand Odysseus downloads a database of [links](https://alcinnz.github.io/Odysseus-recommendations/) I'd recommend you check out, complete with screenshots, on first launch in order to fill in blank slots in your topsites. This manifested as a slower loading time for this page on first-launch, which is precisely not what I want when designing for elementary.

## Indexing visit counts
The first optimization I attempted was to move the counting up of visits to each page into it's own database table. Because by keeping this cache (if I formulate the query to update it correctly, for which I let the SQLite shell guide me towards) the main query can be given more optimization opportunities for it to exploit.

However this only ended up changing the nature of how the problem manifested rather than fixing it. As now the freeze was more noticable but was proportional to how long it has been since you last opened a new tab. So more work was needed.

## Taking care of the freeze
Let's discuss why interactive interfaces freeze. Because inside any non-trivial interface there is some code which repeatedly stops and listens to hear what you want it to do. And if any task you give it takes to long before it returns to this "mainloop" the application will not be able to get to the next task immediately and thus appears "frozen".

The main cause of this in Odysseus are SQLite queries, because SQLite has no awareness of GTK's mainloop. So I changed the indexing query I wrote for the last step to frequently return control to Prosody. And prosody in turn frequently returns control to the mainloop.

Though in this case it turned it didn't return control frequently enough, so that had to be fixed before any improvement could be noticed.

## Degrading the screenshots
The first optimization I did to try and fix the performance of the first-launch was to degrade the image quality of the screenshots so it was less for Odysseus to download in one go. Though unfortunately no matter how hard I tried I couldn't optimize this enough.

## Deferring screenshot downloads
Failing that I decided to move the screenshots out of that initial download to wait until after rendering of the page to be downloaded. And possibly later if they're needed yet. That is I had WebKit fetch these images off my website rather than Prosody. And by doing so I got a huge performance improvement.

Though that may have slowed things down later in that these images are now downloaded from the Web rather than loaded out of the local database, and it may have hurt your privacy (I'm not convinced it did, but I don't want to risk not doing something about it). So I added some code between WebKit and my website which caches the screenshots it downloads.

## Future improvements
While the performance is quite reasonable now, it is still worth optimizing it further. So here are some options I'm aware of that I'll likely investigate persuing in the future:

### Reducing the number of recommended links
Judging by the performance of [my recommendations site](https://alcinnz.github.io/Odysseus-recommendations/) I doubt this'll help any. But I do need to better figure out what I'm doing with these links just for usability concerns.

### Deferring disk writes
Both updating the visit counts and saving the recommended links involve writing data to your SQLite database. Which in turn involves a disk write. But if I could, using say a transaction, defer the disk writes until after the page has rendered that may take care of the main remaining bottleneck.

### Background tidies
It may be useful for many Odysseus features if it would periodically run some queries in the background to update this index before you visit your next new tab. For example this could also be used to clean up old screenshots you that are just cluttering up your disk space anymore.

Thus when you open a new tab those visit counts would have already been tallied thus removing this task from the critical path.
