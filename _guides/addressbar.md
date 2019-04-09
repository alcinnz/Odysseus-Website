---
layout: guide
header: Guide
title: Navigating to pages using the "addressbar"
---

In the center of Odysseus's toolbars is it's "addressbar". Using it you can see what webpage you're on, see how much of it has downloaded, and specify a new page to visit.

To it's left you see an icon provided the current website to represent itself. This is a full-color version of the icons used in the tabbar. And next to it you can see some text specifying what website and page you're viewing. As that page downloads you'll see a progressbar in the background indicating how much of it has downloaded.

For security reasons, all web addresses are rendered using the English/Latinate alphabet, even if you typed it using other alphabets. This helps to prevent phishing attacks, because between the various alphabets there's several letters that can easily be confused.

Clicking the addressbar selects all it's text for easy copy-and-paste, and anything you type in it may be interpreted in multiple ways. In order of precedence this includes:

1. A web address. If you don't specify how the page should be fetched, Odysseus defaults to HTTPS.
2. Autocompletes to a page you've visited previously.
3. Search the web using [DuckDuckGo](https://ddg.gg/).
4. Autocompletions provided by DuckDuckGo are suggested, but only if what you're typing is obviously a search (i.e. it has a space in it).

You can select any of these options from the dropdown that appears as you type.

## Status Icons
On the right of the addressbar is a set of icons indicating the status of the webpage.

If you see ![error](icon:16/error-symbolic) that means this webpage has failed to load, and clicking it will toggle between showing Odysseus's error message and the website's one.

If you see ![padlock](icon:16/security-high-symbolic) it means the Internet connection between you and the website is secured, whereas ![broken padlock](icon:16/security-low-symbolic) means that security was attempted but can't be guaranteed. On the other hand ![mask](icon:16/view-private-symbolic) or ![harddisk](icon:16/computer-symbolic) (depending on your OS) means the page originated from your computer and as such is entirely private.

And if you see ![subscribe icon](http://i5.photobucket.com/albums/y178/Karanan/RSS-transparent_zps76f340ef.png) you can click it to see a list of all webfeeds on this page and the apps you have with which you can subscribe to it with. Clicking one of those app icons will subscribe to that feed via that app. Or if you do not have any compatible installed, Odysseus will show the icon for your package manager and clicking it will recommend compatible apps for you to install.

More icons may be shown to indicate that the webpage has asked for a given permission.
