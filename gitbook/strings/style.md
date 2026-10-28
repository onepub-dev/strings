# Style

The group of style related methods allows you to 'style' a string and test the style of a string.

## isLowerCase

```dart
 static bool isLowerCase(String? string) 
```

The 'isLowerCase' method returns true if the 'string' contains no upper case characters. All other characters, digits etc are allowed.

```dart
Strings.isLowerCase('abc 1234');
-> true
Strings.isLowerCase('abC 1234');
-> false
```

If null is passed the 'string' is treated as an empty string and 'true' is returned.

An empty string also returns `true`.

#### extension

The 'isLowerCase' method is available as an extension to the String class

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

The 'isUpperCase' method returns true if the 'string' contains no lower case characters. All other characters, digits etc are allowed.

```dart
Strings.isUpperCase('ABC 1234');
-> true
Strings.isUpperCase('ABc 1234');
-> false
```

If null or an empty string is passed, `true` is returned.

#### extension

The 'isUpperCase' method is available as an extension on the String class.

```dart
'abcd'.isUpperCase();
-> false
```

## startsWithLowerCase

```dart
 static bool startsWithLowerCase(String? string) 
```

The 'startsWithLowerCase' method returns true if the 'string' starts with an lower case character.

```dart
Strings.startsWithLowerCase('abc 1234');
-> true
Strings.startsWithLowerCase('Abc 1234');
-> false
```

If null is passed the 'string' is treated as an empty string and 'false' is returned.

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

The 'startsWithUpperCase' method returns true if the 'string' starts with an upper case character.

```dart
Strings.startsWithUpperCase('ABC 1234');
-> true
Strings.startsWithUpperCase('abc 1234');
-> false
```

If null is passed the 'string' is treated as an empty string and 'false' is returned.

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

The 'toCamelCase' method converts the `string` to camel case.&#x20;

```dart
Strings.toCamelCase('abc_one');
-> 'AbcOne'
```

If `lower` is true then the first character of the resulting string is lowercase.

```dart
Strings.toCamelCase('abc_one', lower: true);
-> 'abcOne'
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

#### extension

The 'toCamelCase' method is available as an extension on the String class.

```dart
'abc_one'.toCamelCase();
-> 'AbcOne'
```

## toCapitalised

```dart
static String toCapitalised(String? string);
```

The 'toCapitalised' capitalises the first character of the 'string'.

```dart
Strings.toCapitalised('abc one');
-> 'Abc one'
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

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

The 'toLowerCase' method converts the `string` all lower case.

```dart
Strings.toLowerCase('Abc One');
-> 'abc one'
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

## toProperCase

```dart
 static String toProperCase(String? string);
```

The 'toProperCase' method converts the `string` to proper case where in the first letter of each word is capitalised.

```dart
Strings.toProperCase('abc one');
-> 'Abc One'
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

The method is also available as a `String` extension: `'hello world'.toProperCase()` returns `'Hello World'`.

## toSnakeCase

```dart
 static String toSnakeCase(String? string);
```

The 'toSnakeCase' method lowercases the string and inserts an underscore before uppercase letters following word characters. It preserves spaces; it does not turn spaces into underscores.

```dart
Strings.toSnakeCase('abc one');
-> 'abc one'
Strings.toSnakeCase('AbcOne');
-> 'abc_one'
```

If null is passed the 'string' is treated as an empty string and an empty string is returned.

#### extension

The 'toSnakeCase' method is available as an extension method on the String class.

```dart
'AbcDef'.toSnakeCase();
-> 'abc_def'
```



