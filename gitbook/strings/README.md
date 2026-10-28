# Overview

The Strings package is an evolution of work originally produced by Andrew Mezoni.

The purpose of the Strings package is to provide:

* Complement Dart's core `String` class with common string utilities.
* Add extension methods to non-null strings where useful.
* Provide static methods for values that may be null.
* Wrap many core `String` methods for nullable input.

A core objective is to handle null input predictably. Some methods still throw for invalid indexes or missing delimiters; their pages describe those cases.

```dart
// pass a short string and we can pad it (or not).
Strings.right('one', 4, pad: Pad.left);
// ' one'

// passing null works too.
Strings.right(null, 4, pad: Pad.left);
// '    '
```

## Sponsored by OnePub <a href="#sponsored-by-onepub" id="sponsored-by-onepub"></a>

Help support Strings by supporting [OnePub](https://onepub.dev/drive/b37ef958-bdc9-49bc-af7b-d31f1dd7c65d), the private Dart repository.

OnePub allows you to privately share Dart packages across your Team and with your customers.

Try it for free and publish your first private package in seconds.

| ![OnePub logo](.gitbook/assets/image.png) | <p>Publish a private package in five commands:</p><p><mark style="color:green;"><code>flutter pub global activate onepub</code></mark></p><p><mark style="color:green;"><code>onepub login</code></mark><br><mark style="color:green;">cd &#x3C;my package></mark><br><mark style="color:green;">onepub pub private</mark><br><mark style="color:green;">dart pub publish</mark></p> |
| --- | --- |

## Namespace

Strings takes a slightly non-conventional approach by defining all of the exposed methods as statics in the Strings class rather than defining them as global functions.

We took this approach as it provides better support when using auto-completion in an IDE.

Can't remember the name of a Strings function?

Type `Strings.` and your IDE will show you the complete list of methods exposed by the Strings package.

Use `Strings.methodName(...)` for nullable values:

```dart
Strings.right(null, 4, pad: Pad.left); // '    '
Strings.isBlank(null);                 // true
```

## Nullable strings

Dart best practice encourages us to use String rather than String? but the reality is that at times we still need to handle nullable strings.

The Strings package looks to make using String? types as easy as possible whilst reducing bugs and maintenance overheads.

If you need to trim a `String?`, you can use the nullable wrapper:

```dart
String? value;
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

We welcome contributions to the Strings package.

The best way to get involved is to head over to the Strings github repository and fork the project.

If you are looking to add a new method please conform to the current code layout.

### Unit Tests

Before any new functions are added to the library they need reasonable set of unit tests.
