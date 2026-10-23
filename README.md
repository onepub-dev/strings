The Strings package is an evolution of the work originally produced by Andrew Mezoni.

The purpose of the Strings package is to provide:
 * a collection of useful String functions to complement the core String class.
 * where viable, directly extend the String class with methods such as String.right, String.left...
 * provide a safer environment when working with nullable Strings (String?)
 * wrappers for each of the core String methods which are safe to use with a nullable String?.

A core objective of the Strings package is to never 'throw' or return an error but to make a best effort to process the passed data.

```dart
// passing null works too.
Strings.right(null, 4, pad: Pad.left);
 -> '    '

// pass a short string and we can pad it (or not).
Strings.right('one', 4, pad: Pad.left);
 -> ' one'

```

The Strings package also includes a number of methods exposed as extensions to the
core Dart String class:
```dart
'a normal string'.right(4);
-> 'a no'
```

# Literal boundaries

Remove a single literal prefix or suffix, or split once while keeping the
separator and both sides:

```dart
Strings.removePrefix('Bearer token', 'Bearer '); // 'token'
'report.txt'.removeSuffix('.txt'); // 'report'
Strings.partition('key=value=rest', '='); // ['key', '=', 'value=rest']
'archive.tar.gz'.lastPartition('.'); // ['archive.tar', '.', 'gz']
Strings.removePrefix(null, 'prefix'); // ''
```

All four methods are available as nullable `Strings` static methods and as
`StringEx` extensions on `String`. Null input is treated as `''`. A null, empty
or unmatched affix leaves the input unchanged. A null, empty or unmatched
separator produces `[text, '', '']` for `partition` and `['', '', text]` for
`lastPartition`. Partition results always contain three strings; joining them
reconstructs the input.

Matching is literal, case-sensitive UTF-16 matching, with no regular expressions
or Unicode normalization. Complete emoji and combining sequences work as
delimiters. Supplying only part of a surrogate pair or grapheme can split that
character, just as with Dart's native string search and substring methods.

These methods draw on Python's literal affix removal and partition operations.
Unlike Python, empty separators are handled without throwing.

# Counting, extraction and whitespace

```dart
Strings.countMatches('aaaaa', 'aa'); // 2 (non-overlapping)
'key=value=rest'.substringAfter('='); // 'value=rest'
'archive.tar.gz'.substringAfterLast('.'); // 'gz'
'archive.tar.gz'.substringBeforeLast('.'); // 'archive.tar'
Strings.normalizeSpace('  hello\t world  '); // 'hello world'
'one\r\ntwo\u2028three'.replaceLineEndings(); // 'one\ntwo\nthree'
'one\ntwo'.replaceLineEndings(replacement: ' | '); // 'one | two'
```

All six methods have nullable `Strings` statics and `StringEx` extensions on
`String`. Null input is treated as `''`. Search and extraction use literal,
case-sensitive UTF-16 matching without normalization, as described above.

| Method | Null, empty or missing search/separator |
| --- | --- |
| `countMatches` | `0` |
| `substringAfter` | `''` |
| `substringAfterLast` | `''` |
| `substringBeforeLast` | Original input (or `''` for null) |

`normalizeSpace` removes leading/trailing whitespace and collapses internal
runs to one ASCII space. It uses the existing `Strings.isWhitespaceRune` set,
including non-breaking spaces, U+180E and U+FEFF (BOM). Other text is preserved.

`replaceLineEndings` recognizes CRLF as one ending, plus CR, LF, NEL (U+0085),
form feed (U+000C), line separator (U+2028) and paragraph separator (U+2029).
Vertical tab is unchanged. Its default replacement is LF on every platform;
null or empty replacement removes endings. Replacement text is literal and
is not processed again. Other code units are preserved exactly.

The counting and extraction helpers draw on Apache Commons Lang, with empty
separators treated consistently as absent. The newline set follows .NET's
`ReplaceLineEndings`, using deterministic LF rather than a platform default.

# See the full list
The Strings package incudes over 50 functions.

You can see the full list including examples at:

[strings.onepub.dev](https://strings.onepub.dev)

# Contributing:
The strings package is hosted on github at:
[github.com/onepub-dev/strings](https://github.com/onepub-dev/strings)

Contributions are welcomed.

# Sponser
The strings package is sponsored by OnePub - the private Dart repository SaaS.

[onepub.dev](https://onepub.dev)

<img alt="OnePub Logo" src="https://raw.githubusercontent.com/onepub-dev/strings/main/images/onepub-logo.svg" style="width:200px"></img>






