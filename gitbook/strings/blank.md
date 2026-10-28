# Blank

## Testing for blank

A blank String meets at least one of the following criteria:

* null
* zero length
* only contains whitespace

### isBlank

```dart
 static bool isBlank(String? string)
```

The isBlank returns true if ANY ONE of the above criteria holds true

```dart
Strings.isBlank(null);
-> true
Strings.isBlank('');
-> true
Strings.isBlank('\t\n\r ');
-> true
Strings.isBlank('a');
-> false
```

### isNotBlank

```dart
 static bool isNotBlank(String? string)
```

The isNotBlank returns true only if ALL  of the above criteria are invalid

```dart
Strings.isNotBlank(null);
-> false
Strings.isNotBlank('');
-> false
Strings.isNotBlank('\t\n\r ');
-> false
Strings.isNotBlank('a');
-> true
```

Both methods are also available on a non-null `String` as `.isBlank()` and `.isNotBlank()`.

### orElseOnBlank

```dart
static String orElseOnBlank(String? string, String elseString)
```

Returns `elseString` if `string` is null, empty or contains only whitespace. Otherwise it returns the original string unchanged.

```dart
Strings.orElseOnBlank('  ', 'unknown');
-> 'unknown'
Strings.orElseOnBlank(' Alice ', 'unknown');
-> ' Alice '
```

