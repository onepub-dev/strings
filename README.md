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






