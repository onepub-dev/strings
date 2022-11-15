A package of handy string functions.



# definitions

* A blank string is a string which contains only whitespace or is null
* An empty string is a string of zero length or is null


# nullToEmpty

`String nullToEmpty(String? value)`

If [value] is null we return an zero length string otherwise we return [value].

```dart
    expect(Strings.nullToEmpty(null), equals(''));
    expect(Strings.nullToEmpty('abc'), equals('abc'));
```

# isEmpty
Returns true if the [value] is null, or is a zero length String

`bool isEmpty(String? value)`

```dart
   expect(Strings.isEmpty(null), isTrue);
   expect(Strings.isEmpty('  '), isFalse);
   expect(Strings.isEmpty('abc'), isFalse);
```

# isNotEmpty

Returns true if the [value] is not null and is a zero length String

`bool isNotEmpty(String? value)`

```dart
    expect(Strings.isNotEmpty(null), isFalse);
    expect(Strings.isNotEmpty('  '), isTrue);
    expect(Strings.isNotEmpty('abc'), isTrue);
```    

# isBlank

Returns true if the [value] is null or Blank.
Whitespace is ignored

` bool isBlank(String? value)`

```dart
    expect(Strings.isBlank(null), isTrue);
    expect(Strings.isBlank('  '), isTrue);
    expect(Strings.isBlank('abc'), isFalse);
```

# isNotBlank

Returns true if the [value] is not null and not Blank.
A string containing only whitespace is considered blank.
See: [isNotEmpty] to check for non-zero length string.

`bool isNotBlank(String? value)`

```dart
    expect(Strings.isNotBlank(null), isFalse);
    expect(Strings.isNotBlank('  '), isFalse);
    expect(Strings.isNotBlank('abc'), isTrue);
```

# orElse

If [value] is null the [elseValue] is returned
otherwise [value] is returned.

`String orElse(String? value, String elseValue)`

```dart
   expect(Strings.orElse(null, 'one'), equals('one'));
   expect(Strings.orElse('', 'one'), equals(''));
```


# right
Returns all characters from [value] starting at [fromRight] inclusive.

If [fromRight] is outside the bounds of [value] then an
[RangeError] is thrown.

`String right(String value, int fromRight)`

```dart
    expect(Strings.right('one', 0), equals('one'));
    expect(Strings.right('one', 1), equals('ne'));
    expect(Strings.right('one', 2), equals('e'));
    expect(Strings.right('one', 3), equals(''));
    expect(() => Strings.right('one', 4), throwsA(isA<RangeError>()));

```


# left
Returns the first [fromLeft] characters from [value]
If [fromLeft] is longer than [value] then an
[RangeError] is thrown.

`String left(String value, int fromLeft)`

```dart
    expect(Strings.left('one', 0), equals(''));
    expect(Strings.left('one', 1), equals('o'));
    expect(Strings.left('one', 2), equals('on'));
    expect(Strings.left('one', 3), equals('one'));
    expect(() => Strings.left('one', 4), throwsA(isA<RangeError>()));
```

# isNumeric

Checks if [string] is a number by attempting to parse it
as a double.
INFINITY and NaN are not treated as numbers.

`bool isNumeric(String? string)`

```dart
 expect(Strings.isNumeric(null), isFalse);
    expect(Strings.isNumeric(''), isFalse);
    expect(Strings.isNumeric('x'), isFalse);
    expect(Strings.isNumeric('123x'), isFalse);
    expect(Strings.isNumeric('123'), isTrue);
    expect(Strings.isNumeric('+123'), isTrue);
    expect(Strings.isNumeric('123.456'), isTrue);
    expect(Strings.isNumeric('-123'), isTrue);
    expect(Strings.isNumeric(double.infinity.toString()), isFalse);
    expect(Strings.isNumeric(double.nan.toString()), isFalse);
    expect(Strings.isNumeric('0x123'), isFalse);
```


# abbreviate

Abbreviate a string to [maxWidth] by truncating the
string and adding '...' to then truncated string.

The minimum value for [maxWidth] is 4

`String abbreviate(final String str, final int maxWidth, {int offset = 0})`

```dart
    expect(Strings.abbreviate('one two', 4), equals('o...'));
    expect(Strings.abbreviate('one two', 5), equals('on...'));
    expect(Strings.abbreviate('one two', 6), equals('one...'));
    expect(Strings.abbreviate('one two', 7), equals('one two'));
```   

# properCase

Converts [sentence] to proper case by capitalising
the first letter of each word and forcing all other characters to lower case.

`String properCase(String sentence)`

```dart
    expect(Strings.properCase(''), equals(''));
    expect(Strings.properCase('one'), equals('One'));
    expect(Strings.properCase('one two three'), equals('One Two Three'));
    expect(Strings.properCase('ONE'), equals('One'));
    expect(Strings.properCase('ONE TWO THREE'), equals('One Two Three'));

```

# equals

Safely compares two strings.
If both are null returns true
If one of them is null returns false
if both are the same returns true.
  
`bool equals(String? lhs, String? rhs)`

```dart
    expect(Strings.equals(null, null), isTrue);
    expect(Strings.equals('one', null), isFalse);
    expect(Strings.equals(null, 'one'), isFalse);
    expect(Strings.equals('one', 'one'), isTrue);
    expect(Strings.equals('one', 'two'), isFalse);
```









