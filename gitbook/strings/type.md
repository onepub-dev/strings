# Type

## isNumeric

```dart
 static bool isNumeric(String? string) 
```

The 'isNumeric' method checks if 'string' is numeric by attempting to parse it as a double.

Infinity and NaN are not treated as numbers.

```dart
Strings.isNumeric('abc');
-> false
Strings.isNumeric('1234');
-> true
```

If null is passed the 'string' is treated as an empty string and 'false' is returned.

#### extension

The 'isNumeric' method is available as an extension to the String class

```dart
'ABCD'.isNumeric();
-> false
```
