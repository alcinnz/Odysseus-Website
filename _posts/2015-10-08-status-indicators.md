---
layout: post
title: Status Indicators — Odysseus Development Blog
posttitle: Page Status Indicators
header: 8th Oct 2018 — Adrian Cochrane
date: 2018-10-08 20:21:57 1300
categories: design
---

It is my goal in designing Odysseus to keep it looking as simple as it's [MVP](https://www.techopedia.com/definition/27809/minimum-viable-product-mvp) despite it's accumulation of features, and over the last several days I've been working on a UI component that will facilitate that - incorporating numerous new features in a [succinct](http://usabilitypost.com/2009/04/15/8-characteristics-of-successful-user-interfaces/#concise) and [unobtrusive](https://www.wordnik.com/words/unobtrusive) way. Or looked at another way it provides a communication channel through which I can communicate information about webpages in a way they [can't fake it](https://textslashplain.com/2017/01/14/the-line-of-death/).

The way this new UI component works is that it shows a selection of "status indicators" applicable to the current page/tab in the addressbar, most of which are/will-be determined once the page you're visiting has been committed to history. Clicking on may bring up a popover with more information or controls, or it in the future it may simply change it's state. So that when you see an icon here you can trust it means the same thing it always means.

To improve the concision of communication, the icons are all colour-coded with smaller "emblem" icons attached (the latter also helps with accessibility). Currently indicate "secure" (green with a checkmark) and error (red with an exclamation mark), though I plan to make use of enabled, disabled, and active states as well for future indicators.

## Connection security indicators
The first status indicators I implemented were to communicate how secure the connection to a website is. These are two indicators, one for secured connections to webservers and the other for entirely confidential offline pages.

The [HTTPS indicator](https://www.instantssl.com/ssl-certificate-products/https.html) additional several important details about the connection:

* Whether the authenticity checks have passed, depicted dominantly using slightly icons and the color-coding as well as in a textual summary.
* Which authenticity checks failed as bullet points in the summary.
* The human-understandable details of the "cryptographic certificates" being used to authentic these websites. These are rendered like the academic certificates we all understand, and all relevant certificates up to but not including the trusted roots are shown.

I went for this design for a number of reasons:

1. The indicators are positioned far away from the site's favicon to avoid the abiliity for websites to mislead about how secure they are.
2. I mark sites as secure rather than insecure because that gives me a better opportunity to communicate additional security information. This is in contrast to recent developments in [other browsers](https://security.googleblog.com/2016/09/moving-towards-more-secure-web.html) and [elementary OS](https://medium.com/elementaryos/secure-by-default-689abcac6c66).
3. I implemented my own view of cryptographic certificates in order to avoid design traps that seam to emberass other browsers. That is cryptographic certificates includes plenty of random numbers that don't mean anything to anyone except the computer who can derive security guarantees from it. In my display I stripped out the gibberish to create display that maps to it's real-world counterpart you already understand.
4. I included a second icon representing a higher-degree of privacy to make it clear that HTTPS isn't necessarily the gold standard of "[end-to-end encryption](https://protonmail.com/blog/what-is-end-to-end-encryption/)".

**NOTE:** HTTPS qualifies as end-to-end encrypted when your communicating to a website (e.g. [Wikipedia](https://en.wikipedia.org/)) rather than via a website (e.g. [FaceBook](https://facebook.com/)
