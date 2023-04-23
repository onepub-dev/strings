// ignore_for_file: avoid_classes_with_only_static_members

import '../strings.dart';
import 'exceptions.dart';

class Part {
  /// Returns all characters from value starting at [fromRight] inclusive.
  /// If [fromRight] is outside the bounds of [value] then an
  /// [RangeError] is thrown.
  static String right(String value, int fromRight) =>
      value.substring(fromRight);

  /// Returns all characters from value starting at [fromRight] inclusive.
  /// If [fromRight] is null then an empty string is returned.
  /// If [fromRight] is outside the bounds of [value] then an
  /// [RangeError] is thrown.
  static String rightForNull(String? value, int fromRight) =>
      right(value ?? '', fromRight);

  /// Returns the first [fromLeft] characters from [value]
  /// If [fromLeft] is longer than [value] then an
  /// [RangeError] is thrown.
  static String left(String value, int fromLeft) =>
      value.substring(0, fromLeft);

  /// Returns the first [fromLeft] characters from [value]
  /// If [fromLeft] is longer than [value] then an
  /// [RangeError] is thrown.
  static String leftForNull(String? value, int fromLeft) =>
      (value ?? '').substring(0, fromLeft);

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum value for [maxWidth] is 4
  static String abbreviate(String value, int maxWidth, {int offset = 0}) {
    if (maxWidth < 4) {
      throw IllegalArgumentException('Minimum abbreviation width is 4');
    }
    if (value.length <= maxWidth) {
      return value;
    }
    if (offset > value.length) {
      offset = value.length;
    }
    if (value.length - offset < maxWidth - 3) {
      offset = value.length - (maxWidth - 3);
    }
    const abrevMarker = '...';
    if (offset <= 4) {
      return value.substring(0, maxWidth - 3) + abrevMarker;
    }
    if (maxWidth < 7) {
      throw IllegalArgumentException(
          'Minimum abbreviation width with offset is 7');
    }
    if (offset + maxWidth - 3 < value.length) {
      return abrevMarker + abbreviate(value.substring(offset), maxWidth - 3);
    }
    return abrevMarker + value.substring(value.length - (maxWidth - 3));
  }

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// If [value] is null an empty string is returned.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum value for [maxWidth] is 4
  static String abbreviateForNull(String? value, int maxWidth,
          {int offset = 0}) =>
      abbreviate(value ?? '', maxWidth);

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
  static String join(List<Object>? list, {String separator = ''}) =>
      list == null ? '' : list.join(separator);

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
      list == null ? '' : list.map((element) => element ?? '').join(separator);
}
