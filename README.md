# Graphemes

Do string operations based on graphemes instead of codepoints or bytes.
Compare:

```elm
import String.Graphemes

String.toList "🦸🏽‍♂️" --> [ '🦸', '🏽', '\u{200D}', '♂', '\u{FE0F}' ]

String.Graphemes.toList "🦸🏽‍♂️" --> [ "🦸🏽‍♂️" ]
```

This package currently supports **Unicode 12**, including **Emoji 12.1**.

## What's going on here? Graphemes? What are those?

Unicode defines a system for encoding characters as numbers.
These numbers are called codepoints!
For example, `a` is codepoint 97, usually written in hex like `0x0061`.
There is a huge range of possible codepoints (from `0x0000` to `0x10FFFF`), although not all of these match a symbol.

Codepoints are more complex than numbers, though: for a variety of reasons, a codepoint is encoded using 7 bits instead of 8.
That means that we can't use regular 32-bit integers to represent them!

We do this partially for historical compatibility with ASCII, and partially to save space.
For example, you can encode `a` (`0x0061`) in 1 byte, but 🦸  (`0x1F9B8`) takes four.
If they didn't vary in length, you would have to pad out `a` with 3 bytes worth of zeros just to support both in the same string!

There's another layer of optimization, though!
Imagine if you had to store a separate character for each accent mark like a, à, ā, ä, and á.
You'd have a lot of characters on your hands, even before considering capital and lowercase letters!
Plus, some languages use multiple accents for some characters!
The combinations get ridiculous really fast, but we only have 1,114,111 (`0x10FFFF`) possible codepoints!
So what we do is hardcode some combinations (like ä) for efficiency, but make separate codepoints for accents and let the software figure out how to combine them.
These are called diacritic marks.
So in addition to the hardcoded ä, you can put `a` and `¨` together to get the same thing.
You can do this with more-or-less whatever characters and marks you want.

If you get really wild, you end up with z̴̙͒ả̴̫̼̫̀̅ĺ̴̔̿͜g̷̨͇͉̊͐̚o̶̳̣̯͌̓ text!

This raises another problem, though… if I have ä, I think of that as a single character, not two.
But if I've encoded it as two codepoints and ask for the string length, it may tell me I have two characters!
We deal with that using our final level: the grapheme.

A grapheme is what you'd intuitively think of as "a character" in a writing system.
Whenever you combining codepoints you're working with graphemes.
This applies to diacritic marks, as we've already explained, and tons of writing systems use graphemes: Hangul, Devanagari, Thai, and Tamil among others!
But it also applies to emoji!
For example: 🦸🏽‍♂️ is composed of 🦸 + 🏽 + zero-width joiner (200D) + ♂ + variation selector 16 (FE0F).
You tend to think of 🦸🏽‍♂️ as a single character—a very definite expression which can't really be broken up into constituent parts.
That means it's a grapheme!

But, final subtlety: if you used 🦸 by itself it's a grapheme too.
The point is not "what codepoints are there?", it's "what is the smallest useful unit when expressing meaning?"

### So what?

The above means that when we ask questions like "how long is this string?" or "what is the first character here?" we sometimes mix three levels:

1. **the byte level.**
   Operations like `String.length` and `String.left` operate here (or, more specifically, they operate at the UTF-16 level, which assumes that codepoints are two bytes wide.)
   You should probably never operate here when working with `String` in Elm.
   It will result in subtle bugs and corrupt data!
   If you know you're working at the byte level, use [`elm/bytes`](https://package.elm-lang.org/packages/elm/bytes/latest/) instead.

2. **the codepoint level.**
   Here, our base superhero emoji is only one character, but our skin tone and gender (🦸🏽‍♂️) take more, as discussed.
   This particular combination happens to be 17 *bytes* but only 5 *codepoints*.
   Operations like `String.foldl` operate here (so you can safely measure codepoint length with operations like `String.foldl (\_ len -> len + 1) 0 "whatever string"`.)
   You should operate here if you're implementing higher-level operations on the codepoints, like grapheme segmentation (hi!) or normalization.

3. **the grapheme level.**
   Despite being 5 codepoints, 🦸🏽‍♂ is only one grapheme️.
   Operations like `String.Graphemes.toList` operate here.
   You should operate here if you're working with unicode text in ways meaningful to a user.

To underscore, if you're modifying text that the user has entered, work at the grapheme level.
This reduces the possibility of errors and increases the possibility that your program will "do the right thing."

Still not convinced?
Here are some practical reasons you should work at the grapheme level in the browser:

- If you operate at the *byte* level, you will split multi-byte characters into invalid unicode sequences.
  If you do the wrong thing with these sequences, you'll crash your user's browser.
  In fact, that's what started me writing this library!
  Everyone does it occasionally, but there are better ways.

- If you operate at the *character* level, you will split skin tones and genders off of people emoji, split flags into country codes, and move diacritic marks around.
  Your user entered this text precisely in these cases, don't lose their meaning!

- Think your app doesn't need those pesky diacritic marks?
  Think again!
  They're crucial to understanding in a lot of languages!
  For example, in Spanish, papa (potato) is different than papá (father.)
  Don't make your users call their dad a potato!

## Frequently Asked Questions

### What spec does this package implement?

The [Grapheme Cluster Boundaries](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries) section of [UAX #29](https://unicode.org/reports/tr29/).

### Does this package correctly reverse strings with diacritics?

Yes!
It reverses the order of the graphemes, not the codepoints.
This means that it does not move diacritics around and emoji are perfectly safe.

```elm
import String.Graphemes

-- äo without normalization
String.Graphemes.reverse "a\u{0308}o" --> "oa\u{0308}"

-- compare with String
String.reverse "a\u{0308}o" --> "o\u{0308}a"
```

### Does this package do normalization?

No, and it probably never will.
It's a [whole 'nother spec](https://unicode.org/reports/tr15/#Norm_Forms) in the Unicode standard which doesn't really fit in this package.

That said, it *looks* like you could implement it in a similar way as the internal `String.Graphemes.Parser`, so give it a go in a new package of your own!

(n.b. normalization in this case means turning `"a\u{0308}"` into `"ä"`, usually for the purposes of improving equality checks.)

### Does this package segment words or sentences?

No, and it probably never will.
Segmenting words and sentences is locale- and implementation-dependent, so it's really hard to address them in a general way.
Rather than introducing confusion ("it *should* segment here… why doesn't it?") we only segment graphemes.

That said, word and sentence segmentation rely on grapheme segmentation, so you're on the right track by asking this!
[UAX #29](https://unicode.org/reports/tr29/) has guidance here.

### Why not "fix" `elm/core`'s `String` instead of writing a new package?

The `String` module solves a different—but overlapping—set of problems.
For example, you do not always want to work with graphemes: sometimes you need to be able to decompose into codepoints or operate at the byte level.
As usual, it's all tradeoffs.

That said, if it eventually becomes obvious that merging into core would be a good thing we may do that.
In that case, we would probably just keep equivalents of `String.Graphemes.uncons` and `String.Graphemes.foldl`.
Everything else is implemented in terms of those two operations.

### Why a drop-in replacement? / Why does the code refer to `String` functions so much?

Unless you've worked with unicode strings a lot, it can be tricky to know which level (bytes, codepoints, or graphemes) you're operating at with any given time.
So instead of giving you the functions you *might* need, and leaving you to implement the rest on your own, we provide all of them and only change the ones where you'd run into trouble.

But not *all* of the functions in `String` need to be modified.
In those cases, we just pass through to the `String` functions!

This way, you don't have to worry about it.
You could potentially do `import String.Graphemes as String` in a module, fix the type errors, and all of a sudden all your string operations work with graphemes.

## Climate Action

I want my open-source activities to support projects addressing the climate crisis (for example, projects in clean energy, public transit, reforestation, or sustainable agriculture.)
If you are working on such a project, and find a bug or missing feature in any of my libraries, **please let me know and I will treat your issue as high priority.**
I'd also be happy to support such projects in other ways.
In particular, I've worked with Elm for a long time and would be happy to advise on your implementation.

## License

This code in this project is licensed under the BSD 3-Clause license, located at LICENSE in the source.

The documentation strings in `String.Graphemes` are derived from those in `elm/core`'s `String`, © 2019 Evan Czaplicki, and licensed under the BSD 3-Clause license.

The grapheme break property data used here are © 2019 Unicode®, Inc., and licensed under their [terms of use](http://www.unicode.org/terms_of_use.html).
