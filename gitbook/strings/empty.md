# Empty

## Testing for an Empty String

An Empty String is a String that is meats at least ONE of the following criteria

* is null
* is zero length

### isEmpty

```dart
 String isEmpty(String? string)
```

The isEmpty returns true if ANY ONE of the above criteria holds true

```dart
String.isEmpty(null);
-> true
String.isEmpty('');
-> true
String.isEmpty('\t\n\r ');
-> false
String.isEmpty('a');
-> false
```

### isNotEmpty

```dart
 String isNotEmpty(String? string)
```

The isNotBlank returns true only if ALL  of the above criteria are invalid

```dart
String.isNotEmpty(null);
-> false
String.isNotEmpty('');
-> false
String.isNotEmpty('\t\n\r ');
-> true
String.isNotEmpty('a');
-> true

```
