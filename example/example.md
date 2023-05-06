# Examples

See the Strings manual for a full list of examples.

[strings.onepub.dev](https://strings.onepub.dev)

```dart
// Passing a null to any function is safe
Strings.right(null, 4, pad: Pad.left);
 -> '    '

// pass a short string and we can pad it (or not).
Strings.right('one', 4, pad: Pad.left);
 -> ' one'

```