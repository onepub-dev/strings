# Empty

## Testing for an Empty String

An empty String meets at least one of the following criteria:

* is null
* is zero length

### isEmpty

```dart
 static bool isEmpty(String? string)
```

The isEmpty returns true if ANY ONE of the above criteria holds true

```dart
Strings.isEmpty(null);
-> true
Strings.isEmpty('');
-> true
Strings.isEmpty('\t\n\r ');
-> false
Strings.isEmpty('a');
-> false
```

### isNotEmpty

```dart
 static bool isNotEmpty(String? string)
```

The isNotEmpty method returns true only if the string is non-null and has non-zero length.

```dart
Strings.isNotEmpty(null);
-> false
Strings.isNotEmpty('');
-> false
Strings.isNotEmpty('\t\n\r ');
-> true
Strings.isNotEmpty('a');
-> true

```

### toEmpty

```dart
static String toEmpty(String? string)
```

Converts null to `''` and returns a non-null string unchanged.

```dart
Strings.toEmpty(null);
-> ''
Strings.toEmpty('abc');
-> 'abc'
```

### orElse

```dart
static String orElse(String? string, String elsestring)
```

Returns `elsestring` only when `string` is null. An empty string is returned unchanged.

```dart
Strings.orElse(null, 'fallback');
-> 'fallback'
Strings.orElse('', 'fallback');
-> ''
```

### orElseCall

```dart
static String orElseCall(String? string, String Function() elsestring)
```

Calls `elsestring` only when `string` is null, and returns its result. For a non-null string, the callback is not called.

```dart
Strings.orElseCall(null, () => 'fallback');
-> 'fallback'
```
