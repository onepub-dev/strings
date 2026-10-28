# Strings

Strings is a collection of Dart string utilities. It adds methods to non-null `String` values and provides static methods on `Strings` for values that may be null. The package builds on work originally produced by Andrew Mezoni.

```dart
import 'package:strings/strings.dart';
```

## Two ways to call a method

Use an extension method when you already have a non-null `String`:

```dart
'hello world'.toProperCase(); // 'Hello World'
'report.txt'.right(3);        // 'txt'
'dart_vm'.toCamelCase();       // 'DartVm'
```

Use the corresponding `Strings` static method when the value may be null:

```dart
String? value;
Strings.toProperCase(value);             // ''
Strings.right(value, 4, pad: Pad.left); // '    '
Strings.isBlank(value);                 // true
```

Methods such as `Strings.trim` also wrap core `String` methods for nullable input. `String` already has its own non-null `trim` method:

```dart
Strings.trim(value); // ''
'  Dart  '.trim();    // 'Dart'
```

## Common tasks

### Check and default a value

`isEmpty` checks for null or zero length. `isBlank` also considers whitespace-only strings blank. Use `orElseOnBlank` when a display value needs a fallback.

```dart
Strings.isEmpty(' ');                    // false
Strings.isBlank(' ');                    // true
'  '.isBlank();                          // true
Strings.orElseOnBlank('  ', 'Guest');    // 'Guest'
Strings.orElse(null, 'Guest');          // 'Guest'
```

### Take, pad, or join text

`left` and `right` take characters from either end. `Pad` controls whether a short result is padded with spaces. `join` accepts nullable lists and elements.

```dart
'abcdef'.left(3);                              // 'abc'
Strings.right('one', 4, pad: Pad.left);       // ' one'
Strings.join(['red', 'green'], separator: ', '); // 'red, green'
```

### Change case and formatting

```dart
'hello world'.toProperCase();              // 'Hello World'
Strings.toSnakeCase('camelCase');          // 'camel_case'
'dart_vm'.toCamelCase(lower: true);        // 'dartVm'
'hello'.reverse();                         // 'olleh'
```

The same import exposes other helpers for literal boundaries, counting, whitespace normalization, line endings, and nullable wrappers for core `String` methods. The [Strings manual](https://strings.onepub.dev/) groups them by task and gives their null and edge-case behavior. Some operations can throw for invalid indexes or missing delimiters; consult the relevant method page.

## Contributing

The package is hosted at [github.com/onepub-dev/strings](https://github.com/onepub-dev/strings). Contributions are welcome.

## Sponsored by OnePub

Strings is sponsored by [OnePub](https://onepub.dev/), the private Dart repository service.

<img alt="OnePub logo" src="https://raw.githubusercontent.com/onepub-dev/strings/main/images/onepub-logo.svg" width="200">
