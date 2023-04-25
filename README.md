The Strings package is an evolution of work originally produced by Andrew Mezoni.

The purpose of the Strings package is to provide:
 * A collection of useful String functions to complement to the core String class.
 * where viable, directly extend the String class with methods such as String.right, String.left.
 * provide a safer environment when working with nullable Strings (String?)
 * wrappers for each of the core String methods which are safe to use with a nullable String?.

A core objective of the Strings package is to never 'throw' or return an error but to make a best effort to process the passed data.

```dart
// pass a short string and we can pad it (or not).
Strings.right('one', 4, pad: Pad.left);
 -> ' one'

// passing null works too.
Strings.right(null, 4, pad: Pad.left);
 -> '    '
```

The Strings package also includes a number of methods exposed as extensions to the
core Dart String class:
```dart
'a normal string'.right(4);
-> 'a no'
```


Full documentation including examples is available at:

[https://strings.onepub.dev](https://strings.onepub.dev)

# Contributing:
The strings package is hosted on github at:
[https://github.com/onepub-dev/strings](https://github.com/onepub-dev/strings)

Contributions are welcomed.

# Sponser
The strings package is sponsored by OnePub - the private Dart repository SaaS.

[https://onepub.dev](https://onepub.dev)






