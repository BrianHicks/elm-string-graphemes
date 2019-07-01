# Contributing

Thank you for considering contributing to this project!
I really appreciate it!

I don't want to waste your time, so I've outlined some general goals of the project and how it will grow below.
That said, you might have an idea or question that's outside the scope described here!
In that case, go ahead and open an issue and let's discuss.

## Goals

The goal of this library is to mirror `String` from `elm/core`, but operating on graphemes instead of bytes or characters.
PRs that fit with this goal are welcome!
That can mean things like:

- bug fixes to the parser
- performance or filesize enhancements
- documentation improvements
- adding missing functions from `String`
- upgrading to match new versions of Elm or `elm/core`.

## Non-Goals

I probably will not accept PRs extending the API surface area beyond the goals above.
If you need functions like you'd find in `elm-community/string-extra`, you can probably write them yourself using the public functions here!

That said, I'm open to the possibility that working with graphemes might mean we need to do different things.
Just open an issue before you start writing code, please, so we can discuss your use case.
