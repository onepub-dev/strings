import '../strings.dart';
import 'blank.dart';
import 'part.dart';
import 'style.dart';
import 'transform.dart';
import 'type.dart';

/// Provides a set of extensions for the core String class.
/// 
extension StringEx on String {
  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```dart
  /// 'Hello World'.abbreviate(6) == 'Hel...'
  /// ```
  /// The minimum value for [maxWidth] is 4
  String abbreviate(int maxWidth, {int offset = 0}) =>
      Part.abbreviate(this, maxWidth);

  /// true if the this is Blank.
  /// A string that only contains whitespace is considered blank.
  bool isBlank() => Blank.isBlank(this);

  /// true if the this is not Blank.
  /// A string that only contains whitespace is considered blank.
  bool isNotBlank() => Blank.isNotBlank(this);

  /// Returns true if this does not contain upper case letters
  ///
  /// If this is null then we return true.
  ///
  ///
  /// Example:
  ///     print("camelCase".isLowerCase());
  ///     => false
  ///
  ///     print("dart".isLowerCase());
  ///     => true
  ///
  ///     print("".isLowerCase());
  ///     => false
  ///
  bool isLowerCase() => Style.isLowerCase(this);

  /// Checks if this is a number by attempting to parse it
  /// as a double.
  /// INFINITY and NaN are not treated as numbers.
  ///
  /// ```dart
  /// '1.20'.isNumeric();
  /// -> true
  /// ```
  bool isNumeric() => Type.isNumeric(this);

  /// returns true if this only contains
  /// ascii characters. (0 - 128)
  ///
  /// ```dart
  /// 'abcde'.isAcii();
  /// -> true
  /// ```
  bool isAscii() => Type.isAscii(this);

  /// Returns true if this does not contain any lower case letters.
  ///
  /// Example:
  /// ```dart
  ///     print("CamelCase".isUpperCase());
  ///     => false
  ///
  ///     print("DART".isUpperCase());
  ///     => true
  ///
  ///     print("".isUpperCase());
  ///     => false
  /// ```
  ///
  bool isUpperCase() => Style.isUpperCase(this);

  /// Returns the first [length] characters from this
  /// If [length] is longer than this then the result is padded
  /// according to [pad]
  /// ```dart
  /// 'ab'.left(3, pad: Pad.left);
  /// -> ' ab'
  /// ```
  String left(int length, {Pad pad = Pad.none}) =>
      Part.left(this, length, pad: pad);

  /// Returns a string with reversed order of characters.
  ///
  /// Example:
  /// ```dart
  ///     print("hello".reverse());
  ///     => olleh
  /// ```
  String reverse() => Transform.reverse(this);

  /// Returns the right 'n' characters from  this.
  /// If [length] is greater than the length of this then padding
  /// is applied according to [pad].
  /// ```dart
  /// 'ab'.right(3, pad: Pad.right)
  /// -> 'ab '
  /// ```
  String right(int length, {Pad pad = Pad.none}) =>
      Part.right(this, length, pad: pad);

  /// Returns true if this starts with the lower case character.
  ///
  /// Returns false if this is empty
  ///
  /// Example:
  /// ```dart
  ///     print("camelCase".startsWithLowerCase());
  ///     => true
  ///
  ///     print("".startsWithLowerCase());
  ///     => false
  /// ```
  bool startsWithLowerCase() => Style.startsWithLowerCase(this);

  /// Returns true if the string starts with the upper case character.
  ///
  /// Returns false if this is empty.
  ///
  /// Example:
  /// ```dart
  ///     print("Dart".startsWithUpperCase());
  ///     => true
  ///
  ///     print("".startsWithUpperCase());
  ///     => false
  ///```
  bool startsWithUpperCase() => Style.startsWithUpperCase(this);

  /// Returns this in the form "UpperCamelCase" or "lowerCamelCase".
  ///
  /// If [lower] is true, then the first character will be lower case.
  ///
  /// Example:
  /// ```dart
  ///      print("dart_vm".camelize());
  ///      => DartVm
  /// ```
  String toCamelCase({bool lower = false}) =>
      Style.toCamelCase(this, lower: lower);

  /// Returns this with the first character capitalized.
  ///
  /// Example:
  /// ```
  ///     print("dart".capitalize());
  ///     => Dart
  /// ```
  String toCapitalised() => Style.toCapitalised(this);

  /// Returns an escaped string.
  /// The following characters are escaped
  ///```
  /// tab
  /// newline
  /// carriage return
  /// "
  /// '
  /// $
  ///```
  ///
  /// Example:
  /// ```dart
  ///     print("Hello 'world' \n".toEscaped());
  ///     => Hello \'world\' \n
  /// ```
  String toEscaped({String Function(int charCode)? encode}) =>
      Transform.toEscape(this, encode: encode);

  /// Returns an escaped string.
  /// The following characters are escaped
  ///
  ///```
  /// tab
  /// newline
  /// carriage return
  /// ```
  ///
  /// Example:
  /// ```dart
  ///     print("Hello 'world' \n".toPrintable());
  ///     => Hello \'world\' \n
  /// ```
  String toPrintable() => Transform.toPrintable(this);

  /// Converts this to proper case by capitalising
  /// the first letter of each word and forcing all other characters
  /// to lower case.
  /// Example:
  /// ```dart
  /// "one two".toProperCase();
  /// -> "One Two"
  /// ```
  String toProperCase() => Style.toProperCase(this);

  /// Converts this to snake_case by
  /// inserting an underscore before each
  /// sequence of upper case letters and
  /// changing all upper case letters to lowercase.
  ///
  /// Example:
  /// ```dart
  ///     print("DartVM DartCore".toSnakeCase());
  ///     => dart_vm dart_core
  /// ```
  String toSnakeCase() => Style.toSnakeCase(this);

  /// Compare two strings ignoring case.
  /// If rhs is null then returns false
  /// if both are the same, ignoring case, returns true.
  bool equalsIgnoreCase(String? rhs) => Strings.equalsIgnoreCase(this, rhs);
}
