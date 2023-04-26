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

# See the full list
The Strings package incudes over 50 functions.

You can see the full list including examples at:

[https://strings.onepub.dev](https://strings.onepub.dev)

# Contributing:
The strings package is hosted on github at:
[https://github.com/onepub-dev/strings](https://github.com/onepub-dev/strings)

Contributions are welcomed.

# Sponser
The strings package is sponsored by OnePub - the private Dart repository SaaS.

[https://onepub.dev](https://onepub.dev)

![OnePub Logo](https://github.com/onepub.dev/strings/blob/master/images/onepub-logo.svg?raw=true)






