# Parts

## Processing parts of a String

Strings allow you to work with parts of a String, splitting or joining a string.

### abbreviate

```dart
 String abbreviate(String? string, int maxWidth, {int offset = 0})
```

The abbreviate method truncates a string to 'maxWidth' characters and adds '...' to the end.

```dart
String.abbreviate("A long Sentence", 9);
-> A long...
```

The maxWidth argument sets the maxWidth of the resulting String, including the trailing ellipsis (...).

You can use the 'offset' argument to control where the truncation starts from.

<pre class="language-dart"><code class="lang-dart"><strong>String.abbreviate("A long Sentence", 9, offset: 3);
</strong>-> A long Se...
</code></pre>

If the 'string' is shorter than 'maxWidth' then the string is returned without change.

If you pass null then 'string' will be treated as a zero length string.

<pre class="language-dart"><code class="lang-dart"><strong>String.abbreviate(null, 9);
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

The 'hidePart' method replaces a section of the string with replacement character.

This can be used to hide a security token or a password contained within a string.

To hide a section of the string define a `start` position (defaults to 0) and an `end` position (defaults to the end of the string). The `start` position is inclusive and the `end` exclusive (just like substring).

Be default the replacement string is '\*' but you can modify the value by passing an alternate string to `replaceWith`. `replaceWith` is normally a single character but it can be any String.

```dart
Strings.hidePart('my password', start: 3, replaceWith: '#');
-> 'my ########'
```

#### extension

The `hidePart` method is available as an extension method on the String class;

```
'my password'.hidePart(start: 0, end: 2, replaceWith: 'x');
-> 'xx password'
```

## join

```dart
  static String join(List<Object?>? list, {String separator = ''}) 
```

The 'join' method concatenates a list of objects into a String by calling their 'toString' method, separating each item with the separator.

If the 'list' is null an empty String is returned;

If any member of the list is null then just the separator is output for that element.

```dart
Strings.join(['a', 'b', null, 'c'], separator, ',')
-> 'a,b,,c';
```

### left

```dart
  static String left(String? string, int length, {Pad pad = Pad.none})
```

The left method returns the left 'n' characters from a string.

<pre class="language-dart"><code class="lang-dart"><strong>Strings.left('one', 1);
</strong><strong> -> 'o'
</strong></code></pre>

If the String is less than the 'length' passed then you can optionally pad the String to 'length' characters long.

```dart
Strings.left('one', 4, pad: Pad.left);
-> ' one'
Strings.left('one', 4, pad: Pad.right);
-> 'one '
```

By default, no padding will be applied (Pad.none).

```dart
Strings.left('one', 4);
-> 'one'
```

If you pass null then it will be treated as a zero length String.

```dart
Strings.left(null, 4, pad: Pad.left);
-> '    '
```

#### extension

The 'left' method is available as an extension method on the String class.

```dart
'hello world'.left(5);
-> hello
```

### right

```dart
  static String right(String? string, int length, {Pad pad = Pad.none})
```

The right method returns the right 'n' characters from a string.

<pre class="language-dart"><code class="lang-dart"><strong>Strings.right('one', 1);
</strong><strong> -> 'e'
</strong></code></pre>

If the String is less than the 'length' passed then you can optionally pad the String to 'length' characters long.

```dart
Strings.right('one', 4, pad: Pad.left);
-> ' one'
Strings.right('one', 4, pad: Pad.right);
-> 'one '
```

By default, no padding will be applied (Pad.none).

```dart
Strings.right('one', 4);
-> 'one'
```

If you pass null then it will be treated as a zero length String.

```dart
Strings.right(null, 4, pad: Pad.left);
-> '    '
```

#### extension

The 'right' method is available as an extension method on the String class.

```dart
'hello world'.right(5);
-> world
```
