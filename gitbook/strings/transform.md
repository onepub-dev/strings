# Transform

## reverse&#x20;

```dart
String reverse() 
```

The 'reverse' methods reverse the order of characters in a string:

```dart
Strings.reverse('1234');
-> '4321'
```

#### extension

The 'reverse' method is available as an extension to the String class.

```dart
'1234'.reverse();
-> '4321'
```

## toEscaped

```dart
static String toEscaped(String? string, {String Function(int charCode)? encode});
```

The 'toEscaped' escapes the following characters by proceeding them with a leading '\\'

* tab
* newline
* carriage return
* "
* '
* $

```dart
Strings.toEscaped('\t"$Hello"\r\n');
-> r'\t\"\$Hello\"\r\n"
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

The 'encode' function allows you to encode additional characters. As the string is escaped, 'encode' will be called for each character (except for the noted list above) allowing you to return an alternate encoding for that character.

```dart
Strings.toEscaped('abcd', encode: (character) -> character == 'a' ? 'AAA' : character);
-> AAAbcd
```

#### extension

The toEscaped method is available as an extension method on the String class.

```dart
'$abc'.toEscaped();
-> '\$abc'
```

## toPrintable

```dart
static String toPrintable(String? string);
```

The 'toPrintable' escapes the following characters by proceeding them with a leading '\\'

* tab
* newline
* carriage return

```dart
Strings.toPrintable('\t"$Hello"\r\n');
-> r'\t"$Hello"\r\n"
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

#### extension

The toPrintable method is available as an extension method on the String class.

```dart
'"$Hello".toPrintable();
-> r'\"$Hello"'
```

## toUnicode

```dart
static String toUnicode(int? charCode) 
```

The 'toUnicode' returns a unicode representation of the charCode.&#x20;

```dart
 print(toUnicode(50));
  -> \u0032
```

If null is passed an empty string is returned.
