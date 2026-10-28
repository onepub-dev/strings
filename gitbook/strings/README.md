# Overview

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

## Sponsored by OnePub <a href="#sponsored-by-onepub" id="sponsored-by-onepub"></a>

Help support Strings by supporting [OnePub](https://onepub.dev/drive/b37ef958-bdc9-49bc-af7b-d31f1dd7c65d), the private Dart repository.

OnePub allows you to privately share Dart packages across your Team and with your customers.

Try it for free and publish your first private package in seconds.

| ![](.gitbook/assets/image.png)![](/broken/files/rc2pt36Jck9po23ILnYz) | <p>Publish a private package in five commands:</p><p><mark style="color:green;"><code>flutter pub global activate onepub</code></mark></p><p><mark style="color:green;"><code>onepub login</code></mark><br><mark style="color:green;">cd &#x3C;my package></mark><br><mark style="color:green;">onepub pub private</mark><br><mark style="color:green;">dart pub publish</mark></p> |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |

## namespace

Strings takes a slightly non-conventional approach by defining all of the exposed methods as statics in the Strings class rather than defining them as global functions.

We took this approach as it provides better support when using auto-completion in an IDE.

Can't remember the name of a Strings function?

Type `Strings.` and your IDE will show you the complete list of methods exposed by the Strings package.

To use a Strings method use Strings.xxxx

```dart
Strings.abbreviate('A long sentence that goes on forever', 10);
-> 'A long ...'
```



## NNBD

Dart best practice encourages us to use String rather than String? but the reality is that at times we still need to handle nullable strings.

The Strings package looks to make using String? types as easy as possible whilst reducing bugs and maintenance overheads.

If you need to trim a String? you could write:

```dart
value!.trim();
or
(value ?? '').trim();
or 
value == null ? value.trim() : '';
```

or use Strings  and write:

```dart
Strings.trim(value);
```

The null check operator (!) is dangerous, because if the value is null then our app just crashed.

The Strings method is slightly less verbose than the '??' technique, but more importantly it removes the need for the conditional expression which is both hard to read and like every conditional expression, has the potential to introduce bugs into your code base.

## Utility methods

The methods in the  Strings package is loosely group into the following types:

* [Blank](blank.md) - test if a string is blank

```dart
bool isBlank(String? value)
bool isNotBlank(String? value) 
```

* [Empty](empty.md) - test if a string is empty

```dart
bool isEmpty(String? string) 
bool isNotEmpty(String? string)
String orElse(String? string, String elseValue) 
String orElseCall(String? string, String Function() elseValue) 
String toEmpty(String? string)
```

* [Parts](parts.md) - break/merge a string into parts

```dart
String abbreviate(String? string, int maxWidth, {int offset = 0})
String join(List<Object?>? list, {String separator = ''})
 String hidePart(String? string,
      {int start = 0, int? end, String replaceWith = '*'}) 
String left(String? string, int take, {Pad pad = Pad.none})
String right(String? string, int take, {Pad pad = Pad.none})
```

* [Style](style.md) - style a string with different cases etc

```dart
bool isLowerCase(String? string) 
bool isPrintable(int? character)
bool isUpperCase(String? string)
bool startsWithLowerCase(String? string)
bool startsWithUpperCase(String? string) 
String toCamelCase(String? string, {bool lower = false})
String toCapitalised(String? string)
String toProperCase(String? sentence) 
String toSnakeCase(String? string) 
```

* [Transformations](transform.md)

```dart
String reverse(String? string)
String toEscape(String? string,
      {String Function(int charCode)? encode})
String toPrintable(String? string)
String toUnicode(int? charCode) 
```

* [Type](type.md) - check if a string is a given type

```dart
bool isNumeric(String? string)
bool isAscii(String? string)
```

## Extensions to String

The Strings package also provides a set of extension  functions for the String class:

```dart
import 'package:strings/strings.dart';
'a normal string'.left(1);
-> 'a'
```

```dart
String abbreviate(int maxWidth, {int offset = 0})
bool equalsIgnoreCase(String? rhs)
String hidePart(String? string,
      {int start = 0, int? end, String replaceWith = '*'}) 
bool isAscii()
bool isBlank()
bool isNotBlank()
bool isLowerCase() 
bool isNumeric()
bool isUpperCase()
String left(int take, {Pad pad = Pad.none})
String reverse()
String right(int take, {Pad pad = Pad.none})
bool startsWithLowerCase()
bool startsWithUpperCase() 
String toCamelCase({bool lower = false})
String toCapitalised()
String toPrintable()
String toProperCase() 
String toSnakeCase() 
```

## Contributing

We welcome contributions to the Strings package.

The best way to get involved is to head over to the Strings github repository and fork the project.

If you are looking to add a new method please conform to the current code layout.

### Unit Tests

Before any new functions are added to the library they need reasonable set of unit tests.
