import 'part.dart';
import 'style.dart';
import 'transform.dart';
import 'type.dart';

extension StringEx on String {
  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// If this is null an empty string is returned.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum string for [maxWidth] is 4
  String abbreviate(int maxWidth, {int offset = 0}) =>
      Part.abbreviate(this, maxWidth);

  /// Returns true if this does not contain upper case letters
  ///
  /// If this is null then we return true.
  ///
  ///
  /// Example:
  ///     print(isLowerCase("camelCase"));
  ///     => false
  ///
  ///     print(isLowerCase("dart"));
  ///     => true
  ///
  ///     print(isLowerCase(""));
  ///     => false
  ///
  ///     print(isLowerCase(null));
  ///     => false
  bool isLowerCase() => Style.isLowerCase(this);

  /// Checks if this is a number by attempting to parse it
  /// as a double.
  /// INFINITY and NaN are not treated as numbers.
  bool isNumeric() => Type.isNumeric(this);

  /// Returns true if this does not contain any lower case letters.
  ///
  /// If this is null then return true;
  ///
  /// Example:
  ///     print(isUpperCase("CamelCase"));
  ///     => false
  ///
  ///     print(isUpperCase("DART"));
  ///     => true
  ///
  ///     print(isUpperCase(""));
  ///     => false
  ///
  ///     print(isUpperCase(null));
  ///     => true
  bool isUpperCase() => Style.isUpperCase(this);

  /// Returns the first [length] characters from this
  /// If [length] is longer than this then the result is padded
  /// according to [pad]
  /// if this is null it is treated as an empty String and the
  /// above rules are applied.
  String left(int length, {Pad pad = Pad.none}) =>
      Part.left(this, length, pad: pad);

  /// Returns a string with reversed order of characters.
  /// If this is null then returns an empty string.
  ///
  /// Example:
  ///     print(reverse("hello"));
  ///     => olleh
  String reverse() => Transform.reverse(this);

  /// Returns the right 'n' characters from  this.
  /// If [length] is greater than the length of this then padding
  /// is applied according to [pad].
  /// if this is null it is treated as an empty String and the
  /// above rules are applied.
  String right(int length, {Pad pad = Pad.none}) =>
      Part.right(this, length, pad: pad);

  /// Returns true if this starts with the lower case character.
  ///
  /// Returns false if this is empty or null
  ///
  /// Example:
  ///     print(startsWithLowerCase("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCase(""));
  ///     => false
  ///     print(startsWithLowerCase(null));
  ///     => false
  bool startsWithLowerCase() => Style.startsWithLowerCase(this);

  /// Returns true if the string starts with the upper case character.
  ///
  /// Returns false if this is empty.
  ///
  /// Example:
  ///     print(startsWithUpperCase("Dart"));
  ///     => true
  ///
  ///     print(startsWithUpperCase(""));
  ///     => false
  ///
  ///     print(startsWithUpperCase(null));
  ///     => false
  bool startsWithUpperCase() => Style.startsWithUpperCase(this);

  /// Returns this in the form "UpperCamelCase" or "lowerCamelCase".
  /// If this is null then returns an empty String.
  ///
  /// If [lower] is true, then the first character will be lower case.
  ///
  /// Example:
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  String toCamelCase({bool lower = false}) =>
      Style.toCamelCase(this, lower: lower);

  /// Returns this with the first character capitalized.
  /// If this is null then an empty String is returned;
  ///
  /// Example:
  ///     print(capitalize("dart"));
  ///     => Dart
  String toCapitalised() => Style.toCapitalised(this);

  /// Returns an escaped string.
  /// If this is null then an empty string is returned.
  /// The following characters are escaped
  ///
  /// tab
  /// newline
  /// carriage return
  /// "
  /// '
  /// $
  ///
  /// Example:
  ///     print(toEscaped("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  String toEscaped({String Function(int charCode)? encode}) =>
      Transform.toEscape(this, encode: encode);

  /// Returns an escaped string.
  /// If this is null then an empty string is returned.
  /// The following characters are escaped
  ///
  /// tab
  /// newline
  /// carriage return
  ///
  /// Example:
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  String toPrintable() => Transform.toPrintable(this);

  /// Converts this to proper case by capitalising
  /// the first letter of each word and forcing all other characters
  /// to lower case.
  /// If this is null then an empty String is returned.
  String toProperCase() => Style.toProperCase(this);

  /// Converts this to snake_case by
  /// inserting an underscore before each
  /// sequence of upper case letters and
  /// changing all upper case letters to lowercase.
  ///
  /// Returns an empty String if this is null.
  ///
  /// Example:
  ///     print(underscore("DartVM DartCore"));
  ///     => dart_vm dart_core
  String toSnakeCase() => Style.toSnakeCase(this);
}
