// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: avoid_classes_with_only_static_members

import 'blank.dart';
import 'case.dart';
import 'empty.dart';
import 'part.dart';
import 'style.dart';
import 'transform.dart';
import 'type.dart';

/// A set of String utility functions
///
/// A blank string is a string which contains only whitespace
/// An empty string is a string of zero length
class Strings {
  //
  // Methods that test a String
  //

  /// Checks if [string] is a number by attempting to parse it
  /// as a double.
  /// INFINITY and NaN are not treated as numbers.
  static bool isNumeric(String? string) => Type.isNumeric(string);

  /// true if the [string] is null, or is a zero length String
  static bool isEmpty(String? string) => Empty.isEmpty(string);

  /// true if the [string] is not null and is not a zero length String
  static bool isNotEmpty(String? string) => Empty.isNotEmpty(string);

  /// true if the [string] is null or Blank.
  /// A string that only contains whitespace is considered blank.
  /// See: [Empty.isEmpty] to check for a zero length string.
  static bool isBlank(String? string) => Blank.isBlank(string);

  /// true if the [string] is not null and not Blank.
  /// A string containing only whitespace is considered blank.
  /// See: [isNotEmpty] to check for non-zero length string.
  static bool isNotBlank(String? string) => Blank.isNotBlank(string);

  /// Returns true if [string] does not contain upper case letters
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
  static bool isLowerCase(String string) => Style.isLowerCase(string);

  /// Returns true if [string] does not contain upper case letters
  ///
  /// If [string] is null then we return true.
  ///
  ///
  /// Example:
  ///     print(isLowerCaseForNull("camelCase"));
  ///     => false
  ///
  ///     print(isLowerCaseForNull("dart"));
  ///     => true
  ///
  ///     print(isLowerCaseForNull(""));
  ///     => false
  ///
  ///     print(isLowerCaseForNull(null));
  ///     => false
  static bool isLowerCaseForNull(String? string) =>
      Style.isLowerCaseForNull(string);

  /// Returns true if [string] contains only upper case letters
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
  static bool isUpperCase(String string) => Style.isUpperCase(string);

  /// Returns true if [string] does not contain lower case letters.
  ///
  /// If [string] is null then return true;
  ///
  /// Example:
  ///     print(isUpperCaseForNull("CamelCase"));
  ///     => false
  ///
  ///     print(isUpperCaseForNull("DART"));
  ///     => true
  ///
  ///     print(isUpperCaseForNull(""));
  ///     => false
  ///
  ///     print(isUpperCaseForNull(null));
  ///     => true
  static bool isUpperCaseForNull(String? string) =>
      Style.isUpperCaseForNull(string);

  /// Returns true if [character] is a printable ascii
  /// character
  static bool isPrintable(int character) => Style.isPrintable(character);

  /// Returns true if [character] is a printable ascii
  /// character.
  /// If [character] is null  then we return false.
  static bool isPrintableForNull(int? character) =>
      Style.isPrintableForNull(character);

  /// Converts [string] to snake_case by
  /// inserting an underscore before each
  /// sequence of upper case letters and
  /// changing all upper case letters to lowercase.
  ///
  /// Example:
  ///     print(underscore("DartVM DartCore"));
  ///     => dart_vm dart_core
  static String toSnakeCase(String string) => Style.toSnakeCase(string);

  /// Converts [string] to snake_case by
  /// inserting an underscore before each
  /// sequence of upper case letters and
  /// changing all upper case letters to lowercase.
  ///
  /// Returns an empty String if [string] is null.
  ///
  /// Example:
  ///     print(underscore("DartVM DartCore"));
  ///     => dart_vm dart_core
  static String toSnakeCaseForNull(String? string) =>
      Style.toSnakeCaseForNull(string);

  /// Returns true if [string] starts with the lower case character.
  ///
  /// Returns false if [string] is empty.
  ///
  /// Example:
  ///     print(startsWithLowerCase("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCase(""));
  ///     => false
  static bool startsWithLowerCase(String string) =>
      Style.startsWithLowerCase(string);

  /// Returns true if [string] starts with the lower case character.
  ///
  /// Returns false if [string] is empty or null
  ///
  /// Example:
  ///     print(startsWithLowerCaseForNull("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCaseForNull(""));
  ///     => false
  ///     print(startsWithLowerCaseForNull(null));
  ///     => false
  static bool startsWithLowerCaseForNull(String? string) =>
      Style.startsWithLowerCaseForNull(string);

  /// Returns true if the string starts with the upper case character.
  ///
  /// Returns false if [string] is empty.
  ///
  /// Example:
  ///     print(startsWithUpperCase("Dart"));
  ///     => true
  ///
  ///     print(startsWithUpperCase(""));
  ///     => false
  static bool startsWithUpperCase(String string) =>
      Style.startsWithUpperCase(string);

  /// Returns true if the string starts with the upper case character.
  ///
  /// Returns false if [string] is empty.
  ///
  /// Example:
  ///     print(startsWithUpperCaseForNull("Dart"));
  ///     => true
  ///
  ///     print(startsWithUpperCaseForNull(""));
  ///     => false
  ///
  ///     print(startsWithUpperCaseForNull(null));
  ///     => false
  static bool startsWithUpperCaseForNull(String? string) =>
      Style.startsWithLowerCaseForNull(string);

  //
  // Methods that transform a String
  //

  /// If [string] is null we return an zero length string otherwise we
  /// return [string].
  /// Rather than using this method you could call:
  /// string ?? '';
  static String toEmpty(String? string) => Empty.toEmpty(string);

  /// If [string] is not null, then return [string]
  /// If [string] is null call [elsestring] and return the result.
  /// Rather than using this function you could just call:
  /// string ?? elsestring();

  /// If [string] is not null, then return [string]
  /// If [string] is null the [elsestring] is returned
  /// Rather than using this function you could just call:
  /// string ?? elsestring;
  static String orElse(String? string, String elsestring) =>
      Empty.orElse(string, elsestring);

  /// If [string] is not null, then return [string]
  /// If [string] is null call [elsestring] and return the result.
  /// Rather than using this function you could just call:
  /// string ?? elsestring();
  static String orElseCall(String? string, String Function() elsestring) =>
      Empty.orElseCall(string, elsestring);

  /// Methods that deal with parts of a string.

  /// Returns all characters from string starting at [fromRight] inclusive.
  /// If [fromRight] is outside the bounds of [string] then an
  /// [RangeError] is thrown.
  static String right(String string, int fromRight) =>
      Part.right(string, fromRight);

  /// Returns all characters from string starting at [fromRight] inclusive.
  /// If [fromRight] is null then an empty string is returned.
  /// If [fromRight] is outside the bounds of [string] then an
  /// [RangeError] is thrown.
  static String rightForNull(String? string, int fromRight) =>
      Part.rightForNull(string, fromRight);

  /// Returns the first [fromLeft] characters from [string]
  /// If [fromLeft] is longer than [string] then an
  /// [RangeError] is thrown.
  static String left(String string, int fromLeft) =>
      Part.left(string, fromLeft);

  /// Returns the first [fromLeft] characters from [string]
  /// If [fromLeft] is longer than [string] then an
  /// [RangeError] is thrown.
  static String leftForNull(String? string, int fromLeft) =>
      Part.leftForNull(string, fromLeft);

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum string for [maxWidth] is 4
  static String abbreviate(String str, int maxWidth, {int offset = 0}) =>
      Part.abbreviate(str, maxWidth, offset: offset);

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// If [string] is null an empty string is returned.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum string for [maxWidth] is 4
  static String abbreviateForNull(String? string, int maxWidth,
          {int offset = 0}) =>
      Part.abbreviateForNull(string ?? '', maxWidth);

  /// Returns the joined elements of the [list].
  /// If the [list] is null then an empty String is returned.
  ///
  /// Example:
  ///     print(join(null));
  ///     => ''
  ///
  ///     print(join([1, 2]));
  ///     => 12
  ///     print(join([1, 2], separator: ','));
  ///     => 1,2
  static String join(List<Object>? list, [String separator = '']) =>
      Part.join(list, separator: separator);

  /// Returns the joined elements of the [list].
  /// If the [list] is null then an empty String is returned.
  /// If any element in [list] is null it is treated as an empty string
  /// but still included in the list.
  ///
  /// Example:
  ///     print(join(null));
  ///     => ''
  ///
  ///     print(join([1, 2]));
  ///     => 12
  ///     print(join([1, 2], separator: ','));
  ///     => 1,2
  static String joinForNull(List<Object?>? list, {String separator = ''}) =>
      Part.joinForNull(list, separator: separator);

  /// Returns a string with reversed order of characters.
  ///
  /// Example:
  ///     print(reverse("hello"));
  ///     => olleh
  static String reverse(String string) => Transform.reverse(string);

  /// Returns a string with reversed order of characters.
  /// If [string] is null then returns an empty string.
  ///
  /// Example:
  ///     print(reverse("hello"));
  ///     => olleh
  static String reverseForNull(String? string) =>
      Transform.reverseForNull(string);

//
// Methods that apply a style to  a String
//

  /// Converts [sentence] to proper case by capitalising
  /// the first letter of each word and forcing all other characters
  /// to lower case.
  static String toProperCase(String sentence) => Style.toProperCase(sentence);

  /// Converts [sentence] to proper case by capitalising
  /// the first letter of each word and forcing all other characters
  /// to lower case.
  /// If [sentence] is null then an empty String is returned.
  static String toProperCaseForNull(String sentence) =>
      Style.toProperCaseForNull(sentence);

  /// Returns a string in the form "UpperCamelCase" or "lowerCamelCase".
  /// If [lower] is true, then the first character will be lower case.
  ///
  /// Example:
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  static String toCamelCase(String string, {bool lower = false}) =>
      Style.toCamelCase(string, lower: lower);

  /// Returns [string] in the form "UpperCamelCase" or "lowerCamelCase".
  /// If [string] is null then returns an empty String.
  ///
  /// If [lower] is true, then the first character will be lower case.
  ///
  /// Example:
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  static String toCamelCaseForNull(String? string, {bool lower = false}) =>
      Style.toCamelCaseForNull(string, lower: lower);

  /// Returns [string] with the first character capitalized.
  ///
  /// Example:
  ///     print(capitalize("dart"));
  ///     => Dart
  static String toCapitalised(String string) => Case.toCapitalised(string);

  /// Returns [string] with the first character capitalized.
  /// If [string] is null then an empty String is returned;
  ///
  /// Example:
  ///     print(capitalize("dart"));
  ///     => Dart
  static String toCapitalisedForNull(String? string) =>
      Case.toCapitalisedForNull(string);

  /// Returns an escaped string.
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
  static String toEscaped(String string,
          [String Function(int charCode)? encode]) =>
      Transform.toEscape(string, encode);

  /// Returns an escaped string.
  /// If [string] is null then an empty string is returned.
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
  ///     print(toEscapedForNull("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  static String toEscapedForNull(String? string,
          [String Function(int charCode)? encode]) =>
      Transform.toEscapeForNull(string, encode);

  /// Returns an Unicode representation of the character code.
  ///
  /// Example:
  ///     print(toUnicode(48));
  ///     => \u0030
  static String toUnicode(int charCode) => Transform.toUnicode(charCode);

  /// Returns an Unicode representation of the character code.
  /// If [charCode] is null then an empty String is returned.
  ///
  /// Example:
  ///     print(toUnicode(48));
  ///     => \u0030
  static String toUnicodeForNull(int? charCode) =>
      Transform.toUnicodeForNull(charCode);

  /// Returns an escaped string.
  /// The following characters are escaped
  ///
  /// tab
  /// newline
  /// carriage return
  ///
  /// Example:
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  static String toPrintable(String string) => Transform.toPrintable(string);

  /// Returns an escaped string.
  /// If [string] is null then an empty string is returned.
  /// The following characters are escaped
  ///
  /// tab
  /// newline
  /// carriage return
  ///
  /// Example:
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  static String toPrintableForNull(String? string) =>
      Transform.toPrintableForNull(string);

  //
  // Equality checks
  //

  /// Safely compares two strings.
  /// If both are null returns true
  /// If one of them is null returns false
  /// if both are the same returns true.
  ///
  static bool equals(String? lhs, String? rhs) {
    if (lhs == null && rhs == null) return true;

    if (lhs == null) return false;
    if (rhs == null) return false;
    if (!(lhs == rhs)) return false;

    return true;
  }
}
