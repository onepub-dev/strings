# Style

These methods check or change letter case and test whitespace.

## isLowerCase

```dart
 static bool isLowerCase(String? string) 
```

`isLowerCase` returns true when the string has no uppercase letters. Digits, spaces and punctuation are allowed.

```dart
Strings.isLowerCase('abc 1234');
-> true
Strings.isLowerCase('abC 1234');
-> false
```

Null and empty strings return true.

#### extension

`isLowerCase` is also available as a `String` extension.

```dart
'ABCD'.isLowerCase();
-> false
```

## isPrintable

```dart
static bool isPrintable(int? character) 
```

The `isPrintable` method takes a Unicode code point and returns whether its Unicode category is printable.

Null and control characters are not printable. Ordinary spaces are printable under this category check.

```dart
Strings.isPrintable(0x0A); // newline
-> false
Strings.isPrintable(' '.runes.first);
-> true
```

## isWhitespace

```dart
static bool isWhitespace(String string)
```

Returns `true` when every rune is in the package's whitespace set. The input must be non-null; an empty string returns `true`.

```dart
Strings.isWhitespace(' \t');
-> true
Strings.isWhitespace('a ');
-> false
```

## isWhitespaceRune

```dart
static bool isWhitespaceRune(int rune)
```

Checks a single code point. The set includes ASCII whitespace, non-breaking spaces, U+180E and U+FEFF (BOM).

```dart
Strings.isWhitespaceRune(0x00A0);
-> true
```

## isUpperCase

```dart
 static bool isUpperCase(String? string) 
```

`isUpperCase` returns true when the string has no lowercase letters. Digits, spaces and punctuation are allowed.

```dart
Strings.isUpperCase('ABC 1234');
-> true
Strings.isUpperCase('ABc 1234');
-> false
```

If null or an empty string is passed, `true` is returned.

#### extension

`isUpperCase` is also available as a `String` extension.

```dart
'abcd'.isUpperCase();
-> false
```

## startsWithLowerCase

```dart
 static bool startsWithLowerCase(String? string) 
```

`startsWithLowerCase` returns true when the first character is lowercase.

```dart
Strings.startsWithLowerCase('abc 1234');
-> true
Strings.startsWithLowerCase('Abc 1234');
-> false
```

Null or empty input returns false.

#### extension

The method 'startsWithLowerCase' is available as an extension on the String class.

```dart
'abcDEF'.startsWithLowerCase();
-> true
```

## startsWithUpperCase

```dart
 static bool startsWithUpperCase(String? string) 
```

`startsWithUpperCase` returns true when the first character is uppercase.

```dart
Strings.startsWithUpperCase('ABC 1234');
-> true
Strings.startsWithUpperCase('abc 1234');
-> false
```

Null or empty input returns false.

#### extension

The method 'startsWithUpperCase' is available as an extension method on the String class.

```dart
'ABC'.startsWithUpperCase();
-> true
```

## toCamelCase

```dart
 static String toCamelCase(String? string, {bool lower = false});
```

`toCamelCase` converts underscore-separated words to camel case.

```dart
Strings.toCamelCase('abc_one');
-> 'AbcOne'
```

If `lower` is true then the first character of the resulting string is lowercase.

```dart
Strings.toCamelCase('abc_one', lower: true);
-> 'abcOne'
```

Null input returns `''`.

#### extension

`toCamelCase` is also available as a `String` extension.

```dart
'abc_one'.toCamelCase();
-> 'AbcOne'
```

## toCapitalised

```dart
static String toCapitalised(String? string);
```

`toCapitalised` uppercases the first character and leaves the rest unchanged.

```dart
Strings.toCapitalised('abc one');
-> 'Abc one'
```

Null input returns `''`.

#### extension

The `toCapitalised` method is available as an extension on the String class.

```dart
'john'.toCapitalised();
-> 'John'
```

## toLowerCase

```dart
 static String toLowerCase(String? string);
```

`toLowerCase` returns the string in lowercase.

```dart
Strings.toLowerCase('Abc One');
-> 'abc one'
```

Null input returns `''`.

## toProperCase

```dart
 static String toProperCase(String? string);
```

`toProperCase` lowercases each space-separated word, then uppercases its first letter. Repeated spaces are collapsed.

```dart
Strings.toProperCase('abc one');
-> 'Abc One'
```

Null input returns `''`.

The method is also available as a `String` extension: `'hello world'.toProperCase()` returns `'Hello World'`.

## toSnakeCase

```dart
 static String toSnakeCase(String? string);
```

`toSnakeCase` lowercases the text and adds an underscore before uppercase letters that follow word characters. Spaces stay as spaces.

```dart
Strings.toSnakeCase('abc one');
-> 'abc one'
Strings.toSnakeCase('AbcOne');
-> 'abc_one'
```

Null input returns `''`.

#### extension

`toSnakeCase` is also available as a `String` extension.

```dart
'AbcDef'.toSnakeCase();
-> 'abc_def'
```



