---
layout: guide
header: Guide
title: How can I contribute?
---

There are several things you can do to help make Odysseus even more awesome. You do not need to be a software developer to do so.

<dl>
  <dt>Provide feedback</dt>
  <dd>You can post any feedback, positive or negative, to Odysseus's <a href="https://github.com/alcinnz/Odysseus/issues">issue tracker</a>.</dd>
  <dd>Or you can contact me directly via <a href="mailto:alcinnz@lavabit.com">email</a> or <a href="https://floss.social/@alcinnz">the fediverse</a> if you don't have a GitHub account.</dd>
  <dt>Write better documentation</dt>
  <dd>You can help improve Odysseus's documentation by "forking" <a href="https://github.com/alcinnz/Odysseus/tree/gh-pages">this website</a>, you don't need to be a web developer to edit most of the text.</dd>
  <dd>If you are a web developer, feel free to help improve the web design.</dd>
  <dt>Translate Odysseus into your language</dt>
  <dd>If you are bilingual, please go to <a href="https://www.transifex.com/none-483/odysseus/dashboard/">Transifex</a> to translate Odysseus's chrome into your language.</dd>
  <dd>If you want to translate the internal pages or do other localization work, see <a href="#localization">the documentation below</a>.</dd>
  <dt>Contribute financially</dt>
  <dd>You can help me put more time to Odysseus by donating through the <a href="appstream://com.github.alcinnz.odysseus">elementary AppCenter</a> or <a href="https://liberapay.com/alcinnz">Liberapay</a>.</dd>
  <dt>Write code (ofcourse)</dt>
  <dd>If you have the software development skills, feel free to fork <a href="https://github.com/alcinnz/Odysseus">Odysseus</a>. There plenty of <a href="https://github.com/alcinnz/Odysseus/issues">issues</a> you can tackle.</dd>
</dl>

Or if you understandably do not wish to register a GitHub or Transifex account, I'm more than happy to receive contributions via [email](mailto:alcinnz@lavabit.com).

## Localization
If you are bilingual, there are many aspects to localizing Odysseus you can help with. From [translating the text](https://www.transifex.com/none-483/odysseus/dashboard/) that appears in Odysseus, it's marketting, and (see below) internal pages to providing [useful links](https://github.com/alcinnz/Odysseus-recommendations) and (by forking [this site](https://github.com/alcinnz/Odysseus/tree/gh-pages)) documentation.

The internal pages use a [custom file format](https://github.com/alcinnz/Odysseus/wiki/Localizing-Odysseus) for localization. This was done to address segfaults and ease text extraction from the Domain-Specific-Language they're written in. Once you've [forked Odysseus](https://github.com/alcinnz/Odysseus/fork) you can either edit these files directly within `data/page-l10n` or use a suite of commandline tools:

* `bin/extract-message.py` generates `data/page-l10n/Odysseus.messages` with all the translatable text from the internal pages.
* `bin/merge-messages.py LANGUAGE-CODE BASE-FILE=data/page-l10n/Odysseus.messages OUTPUT-FILE=LANGUAGE-CODE` *(`=` indicates default values)* merges the translations from LANGUAGE-CODE into BASE-FILE writing the results into OUTPUT-FILE.
* `bin/edit-messages.py` guides you in editting one of the translation files. If you don't specify a locale it'll prompt for one.
* `bin/message-stats.py` displays the fraction of messages which have been translated for a given locale.

These are best run in Odysseus's repository root directory though they can be run from elsewhere, and all depends on Python3 being installed. Which it probably be is.
