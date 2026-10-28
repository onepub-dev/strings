# Blank

## Testing for blank

A string is blank if it is:

* null
* zero length
* only contains whitespace

### isBlank

```dart
 static bool isBlank(String? string)
```

`isBlank` returns true for any of these cases.

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

`isNotBlank` returns true only when the string contains non-whitespace text.

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

