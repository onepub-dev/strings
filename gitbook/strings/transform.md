# Transform

## reverse

```dart
String reverse() 
```

`reverse` reverses visible characters (grapheme clusters), keeping multi-code-point characters together. Null input returns `''`.

```dart
Strings.reverse('1234');
-> '4321'
```

#### extension

`reverse` is also available as a `String` extension.

```dart
'1234'.reverse();
-> '4321'
```

## normalizeSpace

```dart
static String normalizeSpace(String? string)
```

Removes leading and trailing whitespace and replaces each internal whitespace run with one ASCII space. It uses the same set as [`isWhitespaceRune`](style.md#iswhitespacerune), including non-breaking spaces, U+180E and U+FEFF. Null input returns `''`. Other code units are preserved.

```dart
Strings.normalizeSpace('  hello\t world  ');
-> 'hello world'
'  one\n two  '.normalizeSpace();
-> 'one two'
```

## replaceLineEndings

```dart
static String replaceLineEndings(String? string, {String? replacement = '\n'})
```

Replaces CRLF as one ending, plus CR, LF, NEL (U+0085), form feed (U+000C), line separator (U+2028) and paragraph separator (U+2029). Vertical tab is unchanged. The default replacement is LF on every platform. A null or empty replacement removes endings. The replacement is literal and is not processed again. Null input returns `''`.

```dart
Strings.replaceLineEndings('one\r\ntwo\u2028three');
-> 'one\ntwo\nthree'
'one\ntwo'.replaceLineEndings(replacement: ' | ');
-> 'one | two'
```

## toEscaped

```dart
static String toEscaped(String? string, {String Function(int charCode)? encode});
```

`toEscaped` escapes these characters with a leading backslash:

* tab
* newline
* carriage return
* "
* '
* $
* backslash

```dart
Strings.toEscaped('a\nb');
-> r'a\nb'
```

Null input returns `''`.

The optional `encode` callback supplies an encoding for non-printable characters that do not have a dedicated short escape. By default these use `Strings.toUnicode`.

```dart
Strings.toEscaped(String.fromCharCode(0), encode: (code) => '<$code>');
-> '<0>'
```

#### extension

The toEscaped method is available as an extension method on the String class.

```dart
r'$abc'.toEscaped();
-> r'\$abc'
```

## toPrintable

```dart
static String toPrintable(String? string);
```

`toPrintable` escapes non-printable characters. Quotes and dollar signs remain unchanged.

* tab
* newline
* carriage return

```dart
Strings.toPrintable('a\nb');
-> r'a\nb'
```

Null input returns `''`.

#### extension

The toPrintable method is available as an extension method on the String class.

```dart
r'"$Hello"'.toPrintable();
-> r'"$Hello"'
```

## toUnicode

```dart
static String toUnicode(int? charCode) 
```

`toUnicode` returns a `\u` escape for a Unicode code point, using at least four hexadecimal digits.

```dart
Strings.toUnicode(50);
-> r'\u0032'
```

Null input returns `''`. Values outside the Unicode range throw `RangeError`.

## conjuctionJoin

```dart
static String conjuctionJoin(List<String> list,
    {String separator = ', ', String conjuction = ' or '})
```

Joins items with `separator` between earlier items and `conjuction` before the last item. The defaults produce a comma-separated list ending in “or”. An empty list returns `''`; a one-item list returns that item. The public spelling is `conjuctionJoin` and `conjuction`.

```dart
Strings.conjuctionJoin(['Girl', 'Boy', 'Other']);
-> 'Girl, Boy or Other'
Strings.conjuctionJoin(['red', 'blue'], conjuction: ' and ');
-> 'red and blue'
```
