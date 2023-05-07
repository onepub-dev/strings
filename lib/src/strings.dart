// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: avoid_classes_with_only_static_members

import 'blank.dart';
import 'empty.dart';
import 'part.dart';
import 'safe.dart';
import 'style.dart';
import 'transform.dart';
import 'type.dart';

/// A set of String utility functions that aim to
/// extend the set of  functions available the core String class
/// as well as provding safe methods when working with nullable
/// Strings.
/// A Strings method will never thrown an NPE and aim to provide an
/// expected result by treating the null as an empty String or
/// a space filled String where a range access is applied.
///
/// The same approach is applied for non-null Strings when the strings
/// length would result in a RangeError; Instead we pad the String to ensure
/// code returns the expected length String and you code keesp running
/// rather than crashing.
///
/// e.g.
/// ```dart
/// Strings.substring(null, 2,3);
/// -> ' '
/// ```
class Strings {
  /// hide the default ctor as this is a collection of statics.
  Strings._();

  //
  // Methods that test a String
  //

  /// Checks if [string] is a number by attempting to parse it
  /// as a double.
  ///
  /// INFINITY and NaN are not treated as numbers.
  static bool isNumeric(String? string) => Type.isNumeric(string);

  /// returns true if [string] only contains
  /// ascii characters. (0 - 128)
  static bool isAscii(String? string) => Type.isAscii(string);

  /// true if the [string] is null, or is a zero length String
  static bool isEmpty(String? string) => Empty.isEmpty(string);

  /// true if the [string] is not null and is not a zero length String
  static bool isNotEmpty(String? string) => Empty.isNotEmpty(string);

  /// Returns true if the [string] is null or Blank.
  ///
  /// A string that only contains whitespace is considered blank.
  /// See: [Empty.isEmpty] to check for a zero length string.
  static bool isBlank(String? string) => Blank.isBlank(string);

  /// Returns true if the [string] is not null and not Blank.
  ///
  /// A string containing only whitespace is considered blank.
  /// See: [isNotEmpty] to check for non-zero length string.
  static bool isNotBlank(String? string) => Blank.isNotBlank(string);

  /// Returns true if [string] does not contain upper case letters
  ///
  /// If [string] is null then we return true.
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
  static bool isLowerCase(String? string) => Style.isLowerCase(string);

  /// Returns true if [string] does not contain any lower case letters.
  ///
  /// If [string] is null then return true;
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
  static bool isUpperCase(String? string) => Style.isUpperCase(string);

  /// Returns true if [character] is a printable ascii
  /// character.
  ///
  /// If [character] is null  then we return false.
  static bool isPrintable(int? character) => Style.isPrintable(character);

  /// Converts [string] to snake_case by
  /// inserting an underscore before each
  /// sequence of upper case letters and
  /// changing all upper case letters to lowercase.
  ///
  /// Returns an empty String if [string] is null.
  ///
  /// Example:
  ///     print(toSnakeCase("DartVM DartCore"));
  ///     => dart_vm dart_core
  static String toSnakeCase(String? string) => Style.toSnakeCase(string);

  /// Returns true if [string] starts with the lower case character.
  ///
  /// Returns false if [string] is empty or null
  ///
  /// Example:
  ///     print(startsWithLowerCase("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCase(""));
  ///     => false
  ///     print(startsWithLowerCase(null));
  ///     => false
  static bool startsWithLowerCase(String? string) =>
      Style.startsWithLowerCase(string);

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
  ///
  ///     print(startsWithUpperCase(null));
  ///     => false
  static bool startsWithUpperCase(String? string) =>
      Style.startsWithUpperCase(string);

  //
  // Methods that transform a String
  //

  /// If [string] is null we return a zero length string otherwise we
  /// return [string].
  ///
  static String toEmpty(String? string) => Empty.toEmpty(string);

  /// If [string] is not null, then return [string]
  /// If [string] is null the [elsestring] is returned
  static String orElse(String? string, String elsestring) =>
      Empty.orElse(string, elsestring);

  /// If [string] is not null, then return [string]
  /// If [string] is null, calls [elsestring] and return the result.
  static String orElseCall(String? string, String Function() elsestring) =>
      Empty.orElseCall(string, elsestring);

  /// Methods that deal with parts of a string.

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to the truncated string.
  ///
  /// If [string] is null an empty string is returned.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum string for [maxWidth] is 4
  static String abbreviate(String? string, int maxWidth, {int offset = 0}) =>
      Part.abbreviate(string, maxWidth);

  /// Returns the joined elements of the [list].
  ///
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
  static String join(List<Object?>? list, {String separator = ''}) =>
      Part.join(list, separator: separator);

  /// Obscures part of [string] by replace the characters between
  /// [start] (inclusive) and [end] exclusive with [replaceWith]
  ///
  /// If start is not passed then it is defaults to 0.
  /// If end is not passed it defaults to the end of the string.
  static String hidePart(String? string,
          {int start = 0, int? end, String replaceWith = '*'}) =>
      Part.hidePart(string, start: start, end: end, replaceWith: replaceWith);

  /// Returns left most [take] characters from [string].
  ///
  /// If [take] is longer than [string] then the result is padded
  /// according to [pad]
  /// if [string] is null it is treated as an empty String and the
  /// above rules are applied.
  static String left(String? string, int take, {Pad pad = Pad.none}) =>
      Part.left(string, take, pad: pad);

  /// Returns a string with reversed order of characters.
  ///
  /// If [string] is null then returns an empty string.
  ///
  /// Example:
  ///     print(reverse("hello"));
  ///     => olleh
  static String reverse(String? string) => Transform.reverse(string);

  /// Returns the right most [take] characters from  [string].
  ///
  /// If [take] is greater than the length of [string] then padding
  /// is applied according to [pad].
  /// if [string] is null it is treated as an empty String and the
  /// above rules are applied.
  static String right(String? string, int take, {Pad pad = Pad.none}) =>
      Part.right(string, take, pad: pad);

//
// Methods that apply a style to  a String
//

  /// Converts [sentence] to proper case by capitalising
  /// the first letter of each word and forcing all other characters
  /// to lower case.
  ///
  /// If [sentence] is null then an empty String is returned.
  static String toProperCase(String? sentence) => Style.toProperCase(sentence);

  /// Returns [string] in the form "UpperCamelCase" or "lowerCamelCase".
  ///
  /// If [string] is null then returns an empty String.
  /// If [lower] is true, then the first character will be lower case.
  ///
  /// Example:
  /// ```dart
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  /// ```
  static String toCamelCase(String? string, {bool lower = false}) =>
      Style.toCamelCase(string, lower: lower);

  /// Returns [string] with the first character capitalized.
  ///
  /// If [string] is null then an empty String is returned;
  ///
  /// Example:
  /// ```dart
  ///     print(capitalize("dart"));
  ///     => Dart
  /// ```
  static String toCapitalised(String? string) => Style.toCapitalised(string);

  /// Returns an escaped string.
  ///
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
  /// ```dart
  ///     print(toEscaped("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  /// ```
  static String toEscaped(String? string,
          {String Function(int charCode)? encode}) =>
      Transform.toEscape(string, encode: encode);

  /// Returns an Unicode representation of the character code.
  ///
  /// If [charCode] is null then an empty String is returned.
  ///
  /// Example:
  /// ```dart
  ///     print(toUnicode(48));
  ///     => \u0030
  /// ```
  static String toUnicode(int? charCode) => Transform.toUnicode(charCode);

  /// Returns an escaped string.
  ///
  /// If [string] is null then an empty string is returned.
  /// The following characters are escaped
  ///
  /// tab
  /// newline
  /// carriage return
  ///
  /// Example:
  /// ```dart
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello \'world\' \n
  /// ```
  static String toPrintable(String? string) => Transform.toPrintable(string);

  //
  // Equality checks
  //

  /// Safely compares two nullable strings.
  ///
  /// If both are null returns false
  /// If one of them is null returns false
  /// if both are the same returns true.
  static bool equals(String? lhs, String? rhs) {
    if (lhs == null && rhs == null) return true;

    if (lhs == null) return false;
    if (rhs == null) return false;
    if (!(lhs == rhs)) return false;

    return true;
  }

  /// Compare two nullable strings ignoring case.
  ///
  /// If both are null returns false
  /// If one of them is null returns false
  /// if both are the same, ignoring case, returns true.
  static bool equalsIgnoreCase(String? lhs, String? rhs) {
    if (lhs == null && rhs == null) return true;
    if (lhs == null) return false;
    if (rhs == null) return false;

    return lhs.toLowerCase() == rhs.toLowerCase();
  }

  //
  // Safe wrapper methods for String methods
  //

  /// Refer to [String.length]
  static int length(String? string) => Safe.length(string);

  /// Refer to [String.codeUnits]
  static List<int> codeUnits(String? string) => Safe.codeUnits(string);

  /// Refer to [String.runes]
  static Runes runes(String? string) => Safe.runes(string);

  /// Refer to [String.allMatches]
  static Iterable<Match> allMatches(String? pattern, String string,
          [int start = 0]) =>
      Safe.allMatches(pattern, string, start);

  /// Refer to [Safe.codeUnitAt]
  ///
  /// If [string] is null it is treated as an empty string which will result
  /// in an IndexOutOfBoundsException
  static int codeUnitAt(String? string, int index) =>
      Safe.codeUnitAt(string, index);

  /// Refer to [Safe.compareTo]
  ///
  /// This method has special handling for a null [string] or [other].
  /// If both are null then we return -1
  /// If one of them is null then we use [nullIsLessThan] to determine if
  /// we return -1  or 1.
  static int compareTo(String? string, String? other,
          {bool nullIsLessThan = true}) =>
      Safe.compareTo(string, other, nullIsLessThan: nullIsLessThan);

  /// Refer to [Safe.contains]
  static bool contains(String? string, Pattern other, [int startIndex = 0]) =>
      Safe.contains(string, other, startIndex);

  /// Refer to [Safe.endsWith]
  static bool endsWith(String? string, String? other) =>
      Safe.endsWith(string, other);

  /// Refer to [Safe.indexOf]
  static int indexOf(String? string, Pattern pattern, [int start = 0]) =>
      Safe.indexOf(string, pattern, start);

  /// Refer to [Safe.lastIndexOf]
  static int lastIndexOf(String? string, Pattern pattern, [int? start]) =>
      Safe.lastIndexOf(string, pattern, start);

  /// Refer to [Safe.matchAsPrefix]
  static Match? matchAsPrefix(String? pattern, String string,
          [int start = 0]) =>
      Safe.matchAsPrefix(pattern, string, start);

  /// Refer to [Safe.padLeft]
  static String padLeft(String? string, int width, [String padding = ' ']) =>
      Safe.padLeft(string, width, padding);

  /// Refer to [Safe.padRight]
  static String padRight(String? string, int width, [String padding = ' ']) =>
      Safe.padRight(string, width, padding);

  /// Refer to [Safe.replaceAll]
  static String replaceAll(String? string, Pattern from, String replace) =>
      Safe.replaceAll(string, from, replace);

  /// Refer to [Safe.replaceAllMapped]
  static String replaceAllMapped(
          String? string, Pattern from, String Function(Match match) replace) =>
      Safe.replaceAllMapped(string, from, replace);

  /// Refer to [Safe.replaceFirst]
  static String replaceFirst(String? string, Pattern from, String to,
          [int startIndex = 0]) =>
      Safe.replaceFirst(string, from, to, startIndex);

  /// Refer to [Safe.replaceFirstMapped]
  static String replaceFirstMapped(
          String? string, Pattern from, String Function(Match match) replace,
          [int startIndex = 0]) =>
      Safe.replaceFirstMapped(string, from, replace, startIndex);

  /// Refer to [Safe.replaceRange]
  static String replaceRange(
          String? string, int start, int? end, String replacement) =>
      Safe.replaceRange(string, start, end, replacement);

  /// Refer to [Safe.split]
  static List<String> split(String? string, Pattern pattern) =>
      Safe.split(string, pattern);

  /// Refer to [Safe.splitMapJoin]
  static String splitMapJoin(String? string, Pattern pattern,
          {String Function(Match)? onMatch,
          String Function(String)? onNonMatch}) =>
      Safe.splitMapJoin(string, pattern,
          onMatch: onMatch, onNonMatch: onNonMatch);

  /// Refer to [Safe.startsWith]
  static bool startsWith(String? string, Pattern pattern, [int index = 0]) =>
      Safe.startsWith(string, pattern, index);

  /// Refer to [Safe.substring]
  static String substring(String? string, int start, [int? end]) =>
      Safe.substring(string, start, end);

  /// Refer to [Safe.toLowerCase]
  static String toLowerCase(String? string) => Safe.toLowerCase(string);

  /// Refer to [Safe.toUpperCase]
  static String toUpperCase(String? string) => Safe.toUpperCase(string);

  /// Refer to [Safe.trim]
  static String trim(String? string) => Safe.trim(string);

  /// Refer to [Safe.trimLeft]
  static String trimLeft(String? string) => Safe.trimLeft(string);

  /// Refer to [Safe.trimRight]
  ///
  /// If [string] is null then it is treated as an empty String
  static String trimRight(String? string) => Safe.trimRight(string);
}
