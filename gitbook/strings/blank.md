# Blank

## Testing for blank

A blank String is a String that is meets at least one of the following criteria:

* null
* zero length
* only contains whitespace

### isBlank

```dart
 String isBlank(String? string)
```

The isBlank returns true if ANY ONE of the above criteria holds true

```dart
String.isBlank(null);
-> true
String.isBlank('');
-> true
String.isBlank('\t\n\r ');
-> true
String.isBlank('a');
-> false
```

### isNotBlank

```dart
 String isNotBlank(String? string)
```

The isNotBlank returns true only if ALL  of the above criteria are invalid

```dart
String.isNotBlank(null);
-> false
String.isNotBlank('');
-> false
String.isNotBlank('\t\n\r ');
-> flase
String.isNotBlank('a');
-> true
```

