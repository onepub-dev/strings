// ignore_for_file: avoid_classes_with_only_static_members

import 'package:characters/characters.dart';
import 'package:unicode/unicode.dart' as unicode;

import 'consts.dart';

class Style {
  /// Returns a string in the form "UpperCamelCase" or "lowerCamelCase".
  ///
  /// Example:
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  static String toCamelCase(String value, {bool lower = false}) {
    if (value.isEmpty) {
      return value;
    }

    value = value.toLowerCase();
    var capitlize = true;
    var position = 0;
    var remove = false;
    final sb = StringBuffer();
    final characters = Characters(value);
    for (final s in characters) {
      final runes = s.runes;
      var flag = 0;
      if (runes.length == 1) {
        final c = runes.first;
        if (c <= asciiEnd) {
          flag = ascii[c];
        }
      }

      if (capitlize && flag & alphaMask != 0) {
        if (lower && position == 0) {
          sb.write(s);
        } else {
          sb.write(s.toUpperCase());
        }

        capitlize = false;
        remove = true;
        position++;
      } else {
        if (flag & underscoreMask != 0) {
          if (!remove) {
            sb.write(s);
            remove = true;
          }

          capitlize = true;
        } else {
          if (flag & alphaNumMask != 0) {
            capitlize = false;
            remove = true;
          } else {
            capitlize = true;
            remove = false;
            position = 0;
          }

          sb.write(s);
        }
      }
    }

    return sb.toString();
  }

  /// toCamelCaseForNull
  static String toCamelCaseForNull(String? value, {bool lower = false}) =>
      value == null ? '' : toCamelCase(value, lower: lower);

  /// toPropoerCase
  static String toProperCase(String sentence) {
    final words = sentence.split(' ');
    var result = '';

    for (final word in words) {
      final lower = word.toLowerCase();
      if (lower.isNotEmpty) {
        final proper =
            '${lower.substring(0, 1).toUpperCase()}${lower.substring(1)}';
        result = result.isEmpty ? proper : '$result $proper';
      }
    }
    return result;
  }

  /// toPropoerCaseForNull
  static String toProperCaseForNull(String? sentence) =>
      toProperCase(sentence ?? '');

  /// toLowerCase
  static bool isLowerCase(String string) {
    if (string.isEmpty) {
      return true;
    }

    final characters = Characters(string);
    for (final s in characters) {
      final runes = s.runes;
      if (runes.length == 1) {
        final c = runes.first;
        var flag = 0;
        if (c <= asciiEnd) {
          flag = ascii[c];
        }

        if (c <= asciiEnd) {
          if (flag & upperMask != 0) {
            return false;
          }
        } else {
          if (s == s.toUpperCase()) {
            return false;
          }
        }
      }
    }

    return true;
  }

  static bool isLowerCaseForNull(String? string) =>
      string == null || isLowerCase(string);

  /// Returns true if the string does not contain lower case letters
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
  static bool isUpperCase(String value) {
    if (value.isEmpty) {
      return true;
    }

    final characters = Characters(value);
    for (final s in characters) {
      final runes = s.runes;
      if (runes.length == 1) {
        final c = runes.first;
        var flag = 0;
        if (c <= asciiEnd) {
          flag = ascii[c];
        }

        if (c <= asciiEnd) {
          if (flag & lowerMask != 0) {
            return false;
          }
        } else {
          if (s == s.toLowerCase()) {
            return false;
          }
        }
      }
    }

    return true;
  }

  static bool isUpperCaseForNull(String? string) =>
      string == null || isUpperCase(string);

  /// Returns true if the string starts with the lower case character; otherwise
  /// false;
  ///
  /// Example:
  ///     print(startsWithLowerCase("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCase(""));
  ///     => false
  static bool startsWithLowerCase(String value) {
    if (value.isEmpty) {
      return false;
    }

    final characters = Characters(value);
    final s = characters.first;
    final runes = s.runes;
    if (runes.length == 1) {
      final c = runes.first;
      var flag = 0;
      if (c <= asciiEnd) {
        flag = ascii[c];
      }

      if (c <= asciiEnd) {
        if (flag & lowerMask != 0) {
          return true;
        }
      } else {
        if (s == s.toLowerCase()) {
          return true;
        }
      }
    }

    return false;
  }

  //
  static bool startsWithLowerCaseForNull(String? value) =>
      value != null && startsWithLowerCase(value);

  /// Returns true if [value]] starts with the upper case character; otherwise
  /// false;
  ///
  /// Example:
  ///     print(startsWithUpperCase("Dart"));
  ///     => true
  ///
  ///     print(startsWithUpperCase(""));
  ///     => false
  static bool startsWithUpperCase(String value) {
    if (value.isEmpty) {
      return false;
    }

    final characters = Characters(value);
    final s = characters.first;
    final runes = s.runes;
    if (runes.length == 1) {
      final c = runes.first;
      var flag = 0;
      if (c <= asciiEnd) {
        flag = ascii[c];
      }

      if (c <= asciiEnd) {
        if (flag & upperMask != 0) {
          return true;
        }
      } else {
        if (s == s.toUpperCase()) {
          return true;
        }
      }
    }

    return false;
  }

  //
  static bool startsWithUpperCaseForNull(String? value) =>
      value != null && startsWithLowerCaseForNull(value);

  //
  static String toSnakeCase(String string) {
    if (string.isEmpty) {
      return string;
    }

    final sb = StringBuffer();
    var separate = false;
    final characters = Characters(string);
    for (final s in characters) {
      final runes = s.runes;
      var flag = 0;
      if (runes.length == 1) {
        final c = runes.first;
        if (c <= asciiEnd) {
          flag = ascii[c];
        }
      }

      if (separate && flag & upperMask != 0) {
        sb
          ..write('_')
          ..write(s.toLowerCase());
        separate = true;
      } else {
        if (flag & alphaNumMask != 0) {
          separate = true;
        } else if (flag & underscoreMask != 0 && separate) {
          separate = true;
        } else {
          separate = false;
        }

        sb.write(s.toLowerCase());
      }
    }

    return sb.toString();
  }

  //
  static String toSnakeCaseForNull(String? string) =>
      string == null ? '' : toSnakeCase(string);

// TODO: Optimize via table
// TODO: Improve list of printable characters
  static bool isPrintable(int character) {
    switch (unicode.generalCategories[character]) {
      case unicode.CONTROL:
      case unicode.FORMAT:
      case unicode.LINE_SEPARATOR:
      case unicode.NOT_ASSIGNED:
      case unicode.PARAGRAPH_SEPARATOR:
      case unicode.PRIVATE_USE:
      case unicode.SURROGATE:
        return false;
      default:
        return true;
    }
  }

  static bool isPrintableForNull(int? character) =>
      character != null && isPrintable(character);
}
