---
layout: post
title: Cross Distro Packaging — Odysseus Development Blog
posttitle: Cross Distro Packaging
header: 28th May 2019  — Adrian Cochrane
date: 2019-05-28 13:34:36 1200
categories: dev
---

I've been busy recently packaging Odysseus for multiple distros and making sure it looks great across all of them. Because I've heard from people not on elementary OS who are keen to use Odysseus.

So far I've tested that Odysseus looks great on [XFCE](https://xfce.org/) (I'm surprised how well my icon fits in on [Manjaro](https://manjaro.org/), it's quite a different style from elementary OS) and [GNOME3](https://www.gnome.org/gnome-3/), and have seen a KDE screenshot indicating their "Breeze" theme needs to release an update. And as for packaging it's:

* Still available in the [elementary](https://elementary.io/) [AppCenter](https://appcenter.elementary.io/).
* Now available in the [Arch](https://www.archlinux.org/) [User Repos](https://aur.archlinux.org/).
* It's got a [FlatPak](https://flatpak.org/)<sup title="I tried creating one before, but it didn't have the packages and package versions I needed.">1</sup> (thanks [Alexander Mikhaylenko](https://github.com/alcinnz/Odysseus/commits?author=Exalm)!)
* Being packaged for [NixOS](https://nixos.org/) (thanks [Claes Wallin](https://github.com/alcinnz/Odysseus/commits?author=clacke)!)
* Has a proposal to be included in the [Debian](https://debian.org/).
* Has people interested in possibly packaging it for [Void](https://voidlinux.org/) and [Slackware](http://www.slackware.com/).

## Fixes
The main fix I found necessary was to simplify the layout of the "status icons" in Odysseus's addressbar, but now it works better on elementary OS as well! Previously I had a somewhat hackish layout where I put the icons inside a grid and a button so I could style them correctly, and would clear that grid when you switch tabs or load a new page.

Now I'm tracking the status icon widgets externally to the widget hierarchy and inserting them after the addressbar. Then I ask the theme nicely to render it like a text entry, and insist to elementary's theme that it should not be rendered like a toolbar image button. Because that does not associate it strongly enough with the addressbar.

The other main fix was to handle running distributions with only partial [AppStream](https://www.freedesktop.org/wiki/Distributions/AppStream/) where I cannot link to the installation screens for specific apps. In that case I've decided to instead have Odysseus link to some raw text listing the packages that should be installed to get those apps. This fix was trivial once I figured out what I wanted to do.

## Thoughts on Packaging
I'm actually finding it quite easy. All the concepts and packages map between them quite directly, though I'm not saying the differencing are superficial. Just they are for my purposes.

Besides that I like the concept of package repositories (including [FlatHub](https://flathub.org/home)) not only because I know there's curators ensuring the quality of the app collections, but also because it allows apps like Odysseus to query available packages offline. I do not agree with technologies like AppImage which lack such assurances and discovery, it feels like a step backwards.

## Thoughts on Theming
The hot topic now is [Don't Theme Our Apps](https://stopthemingmy.app/), and while those developers my have a legitimate greivance I cannot sign this honestly. I just don't find it to be a problem in my app development. And I don't consider it an affront for others to rework my branding, because while I do need quality there it's not the aspect I care about.

That's not to say I haven't faced layout issues. There's an issue where I have to specify different toolbar icon sizes for Adwaita as opposed to elementary, which I blame on the theming API (and no I don't see the distinction between a CSS engine and a thming engine) not being good enough. And as mentioned above an overcomplicated and internally ugly layout lead to sizing problems, but that lead me to create a visually identical UI that works better everywhere including elementary OS. As such I don't regret facing those problems.

As to the opponents who view this as against the spirit of software freedom, I have to respectfully disagree. It would be wrong for them to be asking people not to alter their themes as that would prevent them from trying out and suggesting improvements. And it would be wrong for them to ask other platforms (than GNOME3) to not reuse the GTK+ component if they want to change the theme, as code reuse is a core software freedom value. But that's not what they're asking for, they just want people to not just assume any GTK app will work with any theme<sup title="Even if Odysseus often will.">2</sup><sup title="By this measure it may be a good thing elementary is not looking to include FlatHub by default.">3</sup>.

If you're worrying about being able to develop apps for any "Linux" system, it's hard to see a future where you can't do so. Though you'd have to acknowledge those apps may just be good rather than great. And if you're worrying about the birth of the next elementary OS, all that's needed is for users to swap the themes not the distros.

tl;dr Don't expect 

---

1. I tried creating one before, but it didn't have the packages and package versions I needed.
2. Even if Odysseus often will.
3. By this measure it may be a good thing elementary is not looking include FlatHub by default.
