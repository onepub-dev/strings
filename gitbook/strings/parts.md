# Parts

## Processing parts of a String

Use these methods to take, split, mask, count or join text.

### countMatches

```dart
static int countMatches(String? string, String? search)
```

Counts non-overlapping, case-sensitive literal matches. Null or empty input or search text returns zero. Matching uses UTF-16 code units without Unicode normalization.

```dart
Strings.countMatches('aaaaa', 'aa');
-> 2
'aaaaa'.countMatches('aa');
-> 2
Strings.countMatches(null, 'a');
-> 0
```

### substringAfter, substringAfterLast and substringBeforeLast

```dart
static String substringAfter(String? string, String? separator)
static String substringAfterLast(String? string, String? separator)
static String substringBeforeLast(String? string, String? separator)
```

These methods search for a case-sensitive literal separator. `substringAfter` uses the first match; the other two use the last. Null input is treated as `''`. A null, empty or missing separator returns `''` for the two `After` methods and the original input for `substringBeforeLast`.

```dart
Strings.substringAfter('a=b=c', '=');
-> 'b=c'
'a=b=c'.substringAfterLast('=');
-> 'c'
'a=b=c'.substringBeforeLast('=');
-> 'a=b'
```

All three are available as `String` extensions.

### removePrefix and removeSuffix

```dart
static String removePrefix(String? string, String? prefix)
static String removeSuffix(String? string, String? suffix)
```

Remove one matching literal affix. Null input becomes `''`. A null, empty or unmatched affix leaves the input unchanged. Both methods are also `String` extensions.

```dart
Strings.removePrefix('pre-prefix', 'pre-');
-> 'prefix'
'report.txt'.removeSuffix('.txt');
-> 'report'
```

### partition and lastPartition

```dart
static List<String> partition(String? string, String? separator)
static List<String> lastPartition(String? string, String? separator)
```

Split at the first or last case-sensitive literal separator, retaining it as the middle of three strings. Null input is `''`. For a null, empty or absent separator, `partition` returns `[text, '', '']` and `lastPartition` returns `['', '', text]`. Joining the three strings always reconstructs the input. Both methods are also `String` extensions.

```dart
Strings.partition('key=value=rest', '=');
-> ['key', '=', 'value=rest']
'archive.tar.gz'.lastPartition('.');
-> ['archive.tar', '.', 'gz']
```

These literal matching methods do not normalize Unicode. A partial surrogate pair or grapheme supplied as a search value can match or split part of a character, as with Dart's native string search methods.

### abbreviate

```dart
 static String abbreviate(String? string, int maxWidth, {int offset = 0})
```

`abbreviate` shortens a long string and adds `...` at the end.

```dart
Strings.abbreviate('A long Sentence', 9);
-> A long...
```

`maxWidth` includes the three dots in the result.

The public `offset` argument is currently ignored by both `Strings.abbreviate` and the `String` extension. Passing a non-zero offset does not change the result.

Widths below four return the original string unchanged.

If the string fits within `maxWidth`, it is returned unchanged.

Null input returns `''`.

<pre class="language-dart"><code class="lang-dart"><strong>Strings.abbreviate(null, 9);
</strong><strong>-> ''
</strong></code></pre>

#### Extension

The `abbreviate` method is available as an extension method on the String class.

```dart
'abcdef'.abbreviate(5);
-> 'ab...'
```

## hidePart

```dart
static String hidePart(String? string,
      {int start = 0, int? end, String replaceWith = '*'})
```

`hidePart` replaces a section of the string with a chosen replacement.

For example, you can mask part of a token or password before displaying it.

Set `start` (included) and `end` (excluded) to choose the section. `start` defaults to 0, and `end` defaults to the end of the string. Positions count visible characters (grapheme clusters), so a multi-code-point emoji stays together.

By default the replacement string is `*`, but you can modify it with `replaceWith`. This can be any string.

```dart
Strings.hidePart('my password', start: 3, replaceWith: '#');
-> 'my ########'
```

`hidePart` is a `Strings` static method; there is no `String` extension for it.

## join

```dart
  static String join(List<Object?>? list,
      {String separator = '', bool excludeEmpty = false})
```

`join` converts each item to text and combines them with `separator` between items.

Null input returns `''`.

A null item contributes an empty string but still occupies a place in the list.

```dart
Strings.join(['a', 'b', null, 'c'], separator: ',');
-> 'a,b,,c';
```

With `excludeEmpty: true`, null, empty and whitespace-only string elements are omitted before joining. The default is `false`.

```dart
Strings.join(['a', '', null, 'b'], separator: ',', excludeEmpty: true);
-> 'a,b'
```

### left

```dart
  static String left(String? string, int length, {Pad pad = Pad.none})
```

`left` takes the first `length` UTF-16 code units of a string.

<pre class="language-dart"><code class="lang-dart"><strong>Strings.left('one', 1);
</strong><strong> -> 'o'
</strong></code></pre>

If the string is shorter than `length`, you can add spaces on either side.

```dart
Strings.left('one', 4, pad: Pad.left);
-> ' one'
Strings.left('one', 4, pad: Pad.right);
-> 'one '
```

By default, `Pad.none` adds no spaces.

```dart
Strings.left('one', 4);
-> 'one'
```

Null input is treated as `''`.

```dart
Strings.left(null, 4, pad: Pad.left);
-> '    '
```

#### extension

`left` is also available as a `String` extension.

```dart
'hello world'.left(5);
-> hello
```

### right

```dart
  static String right(String? string, int length, {Pad pad = Pad.none})
```

`right` takes the last `length` UTF-16 code units of a string.

<pre class="language-dart"><code class="lang-dart"><strong>Strings.right('one', 1);
</strong><strong> -> 'e'
</strong></code></pre>

If the string is shorter than `length`, you can add spaces on either side.

```dart
Strings.right('one', 4, pad: Pad.left);
-> ' one'
Strings.right('one', 4, pad: Pad.right);
-> 'one '
```

By default, `Pad.none` adds no spaces.

```dart
Strings.right('one', 4);
-> 'one'
```

Null input is treated as `''`.

```dart
Strings.right(null, 4, pad: Pad.left);
-> '    '
```

#### extension

`right` is also available as a `String` extension.

```dart
'hello world'.right(5);
-> world
```

`Pad` is an exported enum with values `left`, `right` and `none`. The `left` and `right` methods count UTF-16 code units, like Dart's `String.substring`.

### within

```dart
static String within(String string, String left, String right)
```

Returns the text after the first left delimiter and before the last right delimiter. Missing delimiters throw `ArgumentError`. The implementation advances one code unit after the left match, so use a single-code-unit left delimiter. All arguments must be non-null.

```dart
Strings.within('<AnInstance>', '<', '>');
-> 'AnInstance'
```

### upTo

```dart
static String upTo(String string, String delimiter)
```

Returns text before the first delimiter, or the entire input if it is absent. Both arguments must be non-null.

```dart
Strings.upTo('name=value', '=');
-> 'name'
```
