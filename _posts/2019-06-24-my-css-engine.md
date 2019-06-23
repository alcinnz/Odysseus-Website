---
layout: post
title: My Own CSS Engine — Odysseus Development Blog
posttitle: My Own CSS Engine
header: 24th June 2019  — Adrian Cochrane
date: 2019-06-24 11:20:20 1200
categories: misc
---

I've [stated before](https://odysseus.adrian.geek.nz/repost/2019/05/31/repost-web-engines-in-haskell.html) how I vital I see it is for new browser engines to be developed, in order to fight the collapse of [browser divirsity](https://css-tricks.com/the-ecological-impact-of-browser-diversity/) and push the web to simplify enough to continue surviving. For my small part of this I implemented a [CSS engine](https://git.nzoss.org.nz/alcinnz/stylish-haskell) from scratch.

I hope my efforts will aid the development of browsers like [Vado](https://github.com/chrisdone/vado), or perhaps even something more novel like one with a voice UI. While I don't believe in the hype of "virtual assistants" like Siri and Cortana, I am particularly interested in the later due to my experience using "smart" TVs. Because I know the inconvenience I experienced there must be blockers to other differently-abled people.

So if you're keen please contact me via [email](mailto:alcinnz@lavabit.com) or [the fediverse](https://floss.social/@alcinnz) so I can best help you!

## Using Stylish Haskell
I implemented my CSS engine "Stylish Haskell" in [Haskell](https://haskell.org/) due to it's pattern matching syntax. This makes it trivial for you to declarative define the CSS properties and how it maps to your datastructures. Though I find Haskell very will suited for the internal code as well.

Put simply, Stylish Haskell has two main entry points each of which outputs a generic type constructed from a dedicated typeclass. The `parse` function outputs a type which knows how to parse at-rules and add style rules, for which I define a basic implementation you can extend.

And the `cascade` function takes that basic implementation in order to output a type which knows how to parse a given CSS properties and translate them into setters. Furthermore this base stylesheet type wraps this typeclass in order to check the syntax of all CSS properties (and expand CSS shorthand properties) in order to ensure invalid properties don't override good ones in CSS cascade. Web developers often rely on that for graceful degradation!

## Implementation of Stylish Haskell
The parser is implemented around [haskell-css-syntax](https://github.com/wereHamster/haskell-css-syntax) with a couple of it's own [parser combinator](https://en.wikipedia.org/wiki/Parser_combinator) utils, and some utilities for skipping over tokens until we reach a known good state again. It was trivial to convert from a parser combinator into a token skipping function using the builtin [`snd`](https://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html#v:snd) function.

Though all the real work is done by the CSS cascade function, which goes through the following steps when storing and retrieving style rules in memory:

1. Split off `!important` properties into higher priority style rules.
2. Expand CSS shorthands and verify property syntax.
3. Sort style rules by selector specificity/line number/stylesheet priority.
4. Evaluate CSS selectors. Haskell had some great syntax for this, but it's interesting to consider the performance benefits a JIT interpretor for Haskell would have.
5. Look up selectors that at least partially match the element in a hashmap index.

After that all properties are loaded into a hashmap for CSS cascade to be read back out into the output trait for CSS inheritance.
