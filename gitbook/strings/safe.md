# Safe

The Strings package provides null safe wrappers for each of the String methods.

Generally, the Safe methods convert a null String? to an empty String before passing the string to the wrapped String method.

In some cases we do additional processing to avoid RangeExceptions and other problems caused by an empty String. These exceptions are noted below.

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
-> [0xxx, 0xyy, 0xzz]
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

## compareTo

```dart
  static int compareTo(String? string, String? other,
      {bool nullIsLessThan = true})
```

The compareTo method returns two Strings returning 1, 0 or -1.

If both `string` and `other` are null then -1 is returned.

If one of `string` and `other` are null then -1 or \` is returned based on 'nullIsLessThan'.

If nullIsLessThan is true than null is treated as less than all other strings.

If nullIsLessThan is false then null is treated as greater than all other strings.

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
Strings.indexOf('abcdef', 'abc);
-> 3
Strings.indexOf(null, 'abc);
-> -1
```

## lastIndexOf

Refer to String.lastIndexOf

```dart
Strings.lastIndexOf('abcdefabc', 'abc); 
-> 6 
Strings.lastIndexOf(null, 'abc); 
-> -1
```

## matchAsPrefix

```dart
Strings.matchAsPrefix(null, 'abc')
-> null
```

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
Strings.replaceAllMapped('abc', 'a', (match) -> 'b');
-> 'bbc';
Strings.replaceAllMapped(null, 'a', (match) -> 'b');
-> ''
```

## replaceFirst

Refer to String.replaceFirst

```dart
Strings.replaceFirst('abcabc', 'abc', 'def);
-> 'defabc'
Strings.replaceFirst(null, 'abc', 'def);
-> ''
```

## replaceFirstMapped

Refer to String.replaceFirstMapped

```dart
Strings.replaceFirstMapped('abcabc', 'a', (match) -> 'b');
-> 'bbcabc';
Strings.replaceFirstMapped(null, 'a', (match) -> 'b');
-> ''
```

## replaceRange

Refer to String.replaceRange

```dart
Strings.replaceRange('abcdef', 3, 6, 'abc');
-> 'abcabc'
Strings.replaceRange(null, 3, 6, 'abc');
-> ''
```

## split

Refer to String.split

```dart
Strings.split('a,b,c,d', ',');
-> ['a', 'b', 'c', 'd'];
Strings.split(null, ',');
-> [];
```

## splitMapJoin

Refer to String.splitMapJoin

```dart
Strings.splitMapJoin('Eats sleeps leaves', RegExp(r'sleeps'),
     onMatch: (m) => '${m[0]}',
    onNonMatch: (n) => '*');
 -> '*sleeps*'
 Strings.splitMapJoin(null, RegExp(r'sleeps'),
     onMatch: (m) => '${m[0]}',
    onNonMatch: (n) => '*');
-> ''
```

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
'   '
```

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
