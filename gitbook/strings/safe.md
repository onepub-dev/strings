# Safe

The Strings package provides nullable wrappers for many core `String` methods.

Generally, the Safe methods convert a null String? to an empty String before passing the string to the wrapped String method.

The wrappers do not remove every possible error. For example, invalid indexes still throw in `codeUnitAt` and `replaceRange`. The special null behaviors are noted below.

## length

Refer to String.length

```dart
Strings.length('abc');
-> 3
Strings.length(null);
-> 0
```

## codeUnits

Refer to String.codeUnits

```dart
Strings.codeUnits('abc')
-> [97, 98, 99]
Strings.codeUnits(null)
-> []
```

## runes

Refer to String.runes

```dart
Strings.runes('abc')
-> list of runes
Strings.runes(null)
-> []
```

## allMatches

```dart
static Iterable<Match> allMatches(String? pattern, String string, [int start = 0])
```

Calls `allMatches` on `pattern ?? ''`. The searched `string` is non-null. A null pattern is an empty pattern, which can match at empty positions.

## codeUnitAt

```dart
static int codeUnitAt(String? string, int index)
```

Reads one UTF-16 code unit. Invalid indexes, including any index on a null input, throw `RangeError`.

## compareTo

```dart
  static int compareTo(String? string, String? other,
      {bool nullIsLessThan = true})
```

The compareTo method compares two nullable strings. For two non-null values, it returns Dart's `String.compareTo` result: negative, zero or positive according to sort order.

If both `string` and `other` are null then 0 is returned.

If exactly one argument is null, the result is -1 or 1 according to `nullIsLessThan`.

If nullIsLessThan is true than null is treated as less than all other strings.

If nullIsLessThan is false then null is treated as greater than all other strings.

```dart
Strings.compareTo(null, null);
-> 0
Strings.compareTo(null, 'a');
-> -1
```

## contains

Refer to String.contains

```dart
Strings.contains('abc', 'ab')
-> true
Strings.contains(null, 'ab')
-> false
```

## endsWith

Refer to String.endsWith

```dart
Strings.endsWith('abc', 'bc')
-> true
Strings.endsWith(null, 'ab')
-> false
```

## indexOf

Refer to String.indexOf

```dart
Strings.indexOf('abcdef', 'abc');
-> 0
Strings.indexOf(null, 'abc');
-> -1
```

## lastIndexOf

Refer to String.lastIndexOf

```dart
Strings.lastIndexOf('abcdefabc', 'abc');
-> 6 
Strings.lastIndexOf(null, 'abc');
-> -1
```

## matchAsPrefix

```dart
Strings.matchAsPrefix('ab', 'abc')?.group(0);
-> 'ab'
```

`matchAsPrefix` takes a nullable pattern and a non-null string. A null pattern is treated as an empty pattern and can produce a zero-length match.

## padLeft

Refer to String.padLeft

```dart
Strings.padLeft('123', 4, '0');
-> 0123
Strings.padLeft(null, 4, '0');
-> 0000
```

## padRight

Refer to String.padRight

```dart
Strings.padRight('123', 4, '0');
-> 1230
Strings.padRight(null, 4, '0');
-> 0000
```

## replaceAll

Refer to String.replaceAll

```dart
Strings.replaceAll('abc', 'ab', 'A');
-> 'Ac'
Strings.replaceAll(null, 'ab', 'A');
-> ''
```

## replaceAllMapped

Refer to String.replaceAllMapped

```dart
Strings.replaceAllMapped('abc', 'a', (match) => 'b');
-> 'bbc';
Strings.replaceAllMapped(null, 'a', (match) => 'b');
-> ''
```

## replaceFirst

Refer to String.replaceFirst

```dart
Strings.replaceFirst('abcabc', 'abc', 'def');
-> 'defabc'
Strings.replaceFirst(null, 'abc', 'def');
-> ''
```

## replaceFirstMapped

Refer to String.replaceFirstMapped

```dart
Strings.replaceFirstMapped('abcabc', 'a', (match) => 'b');
-> 'bbcabc';
Strings.replaceFirstMapped(null, 'a', (match) => 'b');
-> ''
```

## replaceRange

Refer to String.replaceRange

```dart
Strings.replaceRange('abcdef', 3, 6, 'abc');
-> 'abcabc'
```

`replaceRange` uses `''` for null input but still throws `RangeError` when the requested range is outside that empty string.

## split

Refer to String.split

```dart
Strings.split('a,b,c,d', ',');
-> ['a', 'b', 'c', 'd'];
Strings.split(null, ',');
-> [''];
```

## splitMapJoin

Refer to String.splitMapJoin

```dart
Strings.splitMapJoin('Eats sleeps leaves', RegExp(r'sleeps'),
     onMatch: (m) => '${m[0]}',
    onNonMatch: (n) => '*');
 -> '*sleeps*'
```

For null input, `splitMapJoin` processes `''` with the supplied pattern and callbacks; a callback can therefore produce a non-empty result.

## startsWith

Refer to String.startsWith

```dart
Strings.startsWith('abcdef', 'abc');
-> true
Strings.startsWith(null, 'abc');
-> false
```

## substring

Refer to String.substring

The Strings version of substring has special handling of a null string argument.

Instead of replacing it with an empty string we return a string containing spaces of the length required to fulfill the requested start/end index. If end is not passed then we return a single space.

```dart
Strings.substring('abcdef', 0, 3);
-> 'abc'
Strings.substring(null, 0, 3);
-> '   '
```

Invalid indexes on a non-null input still throw `RangeError`.

## toLowerCase

Refer to String.toLowerCase

```dart
Strings.toLowerCase('ABC');
-> 'abc'
Strings.toLowerCase(null);
-> '';
```

## toUpperCase

Refer to String.toUpperCase

```dart
Strings.toUpperCase('abc');
-> ABC
Strings.toUpperCase(null);
-> ''
```

## trim

Refer to String.trim

```dart
Strings.trim('  abc  ');
-> 'abc';
Strings.trim(null);
-> ''
```

## trimLeft

Refer to String.trimLeft

```dart
Strings.trimLeft('  abc ');
-> 'abc '
Strings.trimLeft(null);
-> ''
```

## trimRight

Refer to String.trimRight

```dart
Strings.trimRight('  abc ');
-> '  abc'
Strings.trimRight(null);
-> ''
```
