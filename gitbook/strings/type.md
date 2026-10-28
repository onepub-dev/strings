# Type

## isNumeric

```dart
 static bool isNumeric(String? string) 
```

The 'isNumeric' method checks if 'string' is numeric by attempting to parse it as a double.

The exact strings `Infinity` and `NaN` are not treated as numbers.

```dart
Strings.isNumeric('abc');
-> false
Strings.isNumeric('1234');
-> true
```

If null is passed the 'string' is treated as an empty string and 'false' is returned.

#### extension

The 'isNumeric' method is available as an extension to the String class

```dart
'ABCD'.isNumeric();
-> false
```

## isDigits

```dart
static bool isDigits(String? string)
```

Returns true when every UTF-16 code unit is an ASCII digit (`0`–`9`). Null returns false; an empty string returns true. This is a `Strings` static method only.

```dart
Strings.isDigits('1234');
-> true
Strings.isDigits('12a');
-> false
Strings.isDigits('');
-> true
```

## isAscii

```dart
static bool isAscii(String? string)
```

Checks whether all characters fall in the U+0000–U+007F range, including ASCII control characters and DEL. Null returns false; empty input returns true. The method is also available as a `String` extension.

```dart
Strings.isAscii('abc');
-> true
'é'.isAscii();
-> false
```

## equals

```dart
static bool equals(String? lhs, String? rhs)
```

Compares nullable strings exactly. Two nulls compare equal; one null and one non-null value compare unequal.

```dart
Strings.equals(null, null);
-> true
Strings.equals('abc', 'ABC');
-> false
```

## equalsIgnoreCase

```dart
static bool equalsIgnoreCase(String? lhs, String? rhs)
```

Lowercases both non-null strings before comparison. Two nulls compare equal. The method is also available as `.equalsIgnoreCase(rhs)` on a non-null `String`.

```dart
Strings.equalsIgnoreCase('Dart', 'dart');
-> true
'Dart'.equalsIgnoreCase('dart');
-> true
```
