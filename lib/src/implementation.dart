/// Copyright (C) OnePub IP Pty Ltd - All Rights Reserved
/// Unauthorized copying of this file, via any medium is strictly prohibited
/// Proprietary and confidential
/// Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
///

/// A set of String utility functions
///
/// A blank string is a string which contains only whitespace
/// An empty string is a string of zero length
class Strings {
  /// If [value] is null we return an zero length string otherwise we return [value].
  static String nullToEmpty(String? value) {
    if (value == null) {
      return '';
    } else {
      return value;
    }
  }


  /// true if the [value] is null, or is a zero length String
  static bool isEmpty(String? value) {
    if (value == null) {
      return true;
    }
    return value.isEmpty;
  }

  /// true if the [value] is not null and is a zero length String
  static bool isNotEmpty(String? value) {
    return !isEmpty(value);
  }


  /// true if the [value] is null or Blank.
  /// Whitespace is ignored
  /// See: [isEmpty] to check for a zero length string.
  static bool isBlank(String? value) {
    if (value == null) {
      return true;
    }
    return value.trim().isEmpty;
  }

  /// true if the [value] is not null and not Blank.
  /// A string containing only whitespace is considered blank.
  /// See: [isNotEmpty] to check for non-zero length string.
  static bool isNotBlank(String? value) {
    return !isBlank(value);
  }

  /// If [value] is null the [elseValue] is returned
  /// otherwise [value] is returned.
  static String orElse(String? value, String elseValue) {
    return value ?? elseValue;
  }

  /// Returns all characters from value starting at [fromRight] inclusive.
  /// If [fromRight] is outside the bounds of [value] then an
  /// [RangeError] is thrown.
  static String right(String value, int fromRight) {
    return value.substring(fromRight);
  }

  /// Returns the first [fromLeft] characters from [value]
  /// If [fromLeft] is longer than [value] then an
  /// [RangeError] is thrown.
  static String left(String value, int fromLeft) {
    return value.substring(0, fromLeft);
  }

  /// Checks if [string] is a number by attempting to parse it
  /// as a double.
  /// INFINITY and NaN are not treated as numbers.
  static bool isNumeric(String? string) {
    if (string == null) {
      return false;
    }
    if (string == double.infinity.toString() ||
        string == double.nan.toString()) {
      return false;
    }

    return double.tryParse(string) != null;
  }

  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// The minimum value for [maxWidth] is 4
  static String abbreviate(final String str, final int maxWidth,
      {int offset = 0}) {
    if (maxWidth < 4) {
      throw IllegalArgumentException('Minimum abbreviation width is 4');
    }
    if (str.length <= maxWidth) {
      return str;
    }
    if (offset > str.length) {
      offset = str.length;
    }
    if (str.length - offset < maxWidth - 3) {
      offset = str.length - (maxWidth - 3);
    }
    final abrevMarker = '...';
    if (offset <= 4) {
      return str.substring(0, maxWidth - 3) + abrevMarker;
    }
    if (maxWidth < 7) {
      throw IllegalArgumentException(
          'Minimum abbreviation width with offset is 7');
    }
    if (offset + maxWidth - 3 < str.length) {
      return abrevMarker + abbreviate(str.substring(offset), maxWidth - 3);
    }
    return abrevMarker + str.substring(str.length - (maxWidth - 3));
  }

  /// Converts [sentence] to proper case by capitalising
  /// the first letter of each word and forcing all other characters to lower case.
  static String properCase(String sentence) {
    var words = sentence.split(' ');
    var result = '';

    for (var word in words) {
      var lower = word.toLowerCase();
      if (lower.isNotEmpty) {
        var proper =
            '${lower.substring(0, 1).toUpperCase()}${lower.substring(1)}';
        result = result.isEmpty ? proper : '$result $proper';
      }
    }
    return result;
  }

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

class StringsException implements Exception {
  StringsException(this.message);
  String message;
}

class IllegalArgumentException extends StringsException {
  IllegalArgumentException(String message) : super(message);
}
