# Overview

The Strings package is an evolution of work originally produced by Andrew Mezoni.

The purpose of the Strings package is to provide:

* Complement Dart's core `String` class with common string utilities.
* Add extension methods to non-null strings where useful.
* Provide static methods for values that may be null.
* Wrap many core `String` methods for nullable input.

A core objective is to handle null input predictably. Some methods still throw for invalid indexes or missing delimiters; their pages describe those cases.

```dart
import 'package:strings/strings.dart';

// pass a short string and we can pad it (or not).
Strings.right('one', 4, pad: Pad.left);
// ' one'

// passing null works too.
Strings.right(null, 4, pad: Pad.left);
// '    '
```

## Sponsored by OnePub <a href="#sponsored-by-onepub" id="sponsored-by-onepub"></a>

Strings is sponsored by [OnePub](https://onepub.dev/), the private Dart repository service.

OnePub lets you privately share Dart packages with your team and customers.

Try it for free and publish your first private package in seconds.

| ![OnePub logo](.gitbook/assets/image.png) | <p>Publish a private package in five commands:</p><p><mark style="color:green;"><code>flutter pub global activate onepub</code></mark></p><p><mark style="color:green;"><code>onepub login</code></mark><br><mark style="color:green;">cd &#x3C;my package></mark><br><mark style="color:green;">onepub pub private</mark><br><mark style="color:green;">dart pub publish</mark></p> |
| --- | --- |

## Namespace

The package groups nullable utility methods as statics on `Strings` rather than as global functions.

This makes them easy to find with IDE completion: type `Strings.` to see the available methods.

Use `Strings.methodName(...)` for nullable values:

```dart
Strings.right(null, 4, pad: Pad.left); // '    '
Strings.isBlank(null);                 // true
```

## Nullable strings

Most Dart strings are non-null, but some values have type `String?`. `Strings` methods let you work with those values directly.

If you need to trim a `String?`, you can use the nullable wrapper:

```dart
String? value = null;
Strings.trim(value); // ''
```

For a non-null `String`, use its existing method or one of this package's extensions:

```dart
'  Dart  '.trim();             // 'Dart'
'hello world'.toProperCase(); // 'Hello World'
```

## Utility methods

The manual follows the existing groups:

* [Blank](blank.md) checks whitespace and provides fallbacks.
* [Empty](empty.md) checks zero-length strings and handles null values.
* [Parts](parts.md) takes, pads, joins, masks, counts and extracts text.
* [Safe](safe.md) wraps core `String` methods for nullable input.
* [Style](style.md) checks or changes letter case and whitespace.
* [Transform](transform.md) reverses, escapes and normalizes text.
* [Type](type.md) checks numeric and ASCII content and compares values.

Common calls include:

```dart
Strings.orElseOnBlank('  ', 'Guest');         // 'Guest'
Strings.join(['red', 'green'], separator: ', '); // 'red, green'
Strings.toSnakeCase('camelCase');            // 'camel_case'
```

## Extensions to String

The `StringEx` extension adds methods to non-null `String` values. The corresponding `Strings` statics accept nullable input when their signatures use `String?`:

```dart
import 'package:strings/strings.dart';

'hello world'.toProperCase();       // 'Hello World'
Strings.toProperCase(null);         // ''

'one'.right(4, pad: Pad.left);      // ' one'
Strings.right(null, 4, pad: Pad.left); // '    '

'  '.isBlank();                     // true
Strings.isBlank(null);             // true
```

## Contributing

Contributions are welcome in the [Strings GitHub repository](https://github.com/onepub-dev/strings). Follow the existing code layout when adding a method.

### Unit Tests

Include focused unit tests for each new function.
