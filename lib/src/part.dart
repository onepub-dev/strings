// ignore_for_file: avoid_classes_with_only_static_members

import 'package:characters/characters.dart';

import '../strings.dart';

/// Control the padding on functions that allow the result
/// to be padded.
enum Pad {
  /// Add the padding to the left of the String
  left,

  /// Add the padding to the right of the String
  right,

  /// Do not pad the String.
  none
}

class Part {
  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// Pass an [offset] to to start the abbreviation from the given
  /// [offset].  The returned string will included everything before
  /// the offset plus as well as the abreviate text staring from the offset.
  /// If [maxWidth] is less than 4 then we just truncate the string
  /// to the given width.
  /// If [string] is shorter than maxWidth we just return [string].
  /// If [string] is null we return an empty string.
  static String abbreviate(String? string, int maxWidth, {int offset = 0}) {
    if (string == null) {
      return '';
    }
    final length = string.length;
    if (length <= maxWidth || maxWidth < 4) {
      return string;
    }
    if (offset > length) {
      offset = length;
    }
    if (length - offset < maxWidth - 3) {
      offset = length - (maxWidth - 3);
    }
    const abrevMarker = '...';
    if (offset <= 4) {
      return string.substring(0, maxWidth - 3) + abrevMarker;
    }

    if (offset + maxWidth - 3 < length) {
      return abrevMarker + abbreviate(string.substring(offset), maxWidth - 3);
    }
    return abrevMarker + string.substring(length - (maxWidth - 3));
  }

  /// Hides part of a string by replace the characters between
  /// [start] (inclusive) and [end] exclusive.
  /// If start is not passed then it is defaults to 0.
  /// If end is it defaults to the end of the string.
  ///
  /// By default characters are replaced with '*' however you can
  /// choose an alternate character(s) by passing [replaceWith].
  static String hidePart(String? string,
      {int start = 0, int? end, String replaceWith = '*'}) {
    if (string == null) {
      return '';
    }
    end ??= string.length;

    final characters = Characters(string);
    final sb = StringBuffer();
    var pos = 0;

    for (final ch in characters) {
      if (pos >= start && pos < end) {
        sb.write(replaceWith);
      } else {
        sb.write(ch);
      }

      pos++;
    }
    return sb.toString();
  }

  /// Returns the joined elements of the [list].
  /// If the [list] is null then an empty String is returned.
  /// If any element in [list] is null it is treated as an empty string
  /// but still included in the list.
  /// If [excludeEmpty] is true then any empty elements are not included.
  ///
  /// Example:
  ///     print(join(null));
  ///     => ''
  ///
  ///     print(join([1, 2]));
  ///     => 12
  ///     print(join([1, 2], separator: ','));
  ///     => 1,2
  static String join(List<Object?>? list,
      {String separator = '', bool excludeEmpty = false}) {
    if (list == null) {
      return '';
    }

    if (excludeEmpty) {
      final nonEmptyElements = list.where((element) =>
          element != null &&
          ((element is! String) || Strings.isNotBlank(element)));
      return nonEmptyElements.map((element) => element ?? '').join(separator);
    }
    return list.map((element) => element ?? '').join(separator);
  }

  /// Returns the first [take] characters from [string]
  /// If [take] is longer than [string] then the result is padded
  /// according to [pad]
  static String left(String? string, int take, {Pad pad = Pad.none}) {
    string ??= '';

    final length = string.length;
    if (length >= take) {
      return string.substring(0, take);
    }

    final padLength = take - length;

    switch (pad) {
      case Pad.left:
        return "${' ' * padLength}$string";
      case Pad.right:
        return "$string${' ' * padLength}";
      case Pad.none:
        return string;
    }
  }

  /// Returns all characters from [string] starting at [take] inclusive.
  /// If [take] is outside the bounds of [string] then padding
  /// is applied according to [pad].
  static String right(String? string, int take, {Pad pad = Pad.none}) {
    string ??= '';

    final length = string.length;
    if (length >= take) {
      return string.substring(length - take);
    }

    final padLength = take - length;

    switch (pad) {
      case Pad.left:
        return "${' ' * padLength}$string";
      case Pad.right:
        return "$string${' ' * padLength}";
      case Pad.none:
        return string;
    }
  }

  /// Returns the string bounded by the left and right delimiters.
  /// Throws an exception if either of the delimiters are missing.
  /// If there are nested delimiters we return the outer most
  /// delimiters.
  static String within(String string, String left, String right) {
    final leftIndex = string.indexOf(left);
    final rightIndex = string.lastIndexOf(right);

    if (leftIndex == -1) {
      throw ArgumentError('The left bounding character was missing');
    }

    if (rightIndex == -1) {
      throw ArgumentError('The right bounding character was missing');
    }

    final within = string.substring(leftIndex + 1, rightIndex);
    return within;
  }

  /// Returns the left most part of a string upto,
  /// but not including, the [delimiter]
  ///
  /// If there is no [delimiter] found then the entire string
  /// is returned.
  ///
  static String upTo(String string, String delimiter) {
    var index = string.indexOf(delimiter);
    if (index == -1) {
      index = string.length;
    }
    return string.substring(0, index);
  }
}
