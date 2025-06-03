// ignore_for_file: avoid_classes_with_only_static_members

import 'package:characters/characters.dart';
import 'package:unicode/unicode.dart' as unicode;

import 'consts.dart';

class Style {
  /// toLowerCase
  static bool isLowerCase(String? string) {
    if (string == null) {
      return true;
    }
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

/// True if [character] is visible if printed
/// to the console.
  static bool isPrintable(int? character) {
    if (character == null) {
      return false;
    }
    switch (unicode.generalCategories[character]) {
      case unicode.control:
      case unicode.format:
      case unicode.lineSeparator:
      case unicode.notAssigned:
      case unicode.paragraphSeparator:
      case unicode.privateUse:
      case unicode.surrogate:
        return false;
      default:
        return true;
    }
  }

  /// True if the passed character is a whitespace character.
  /// Our definition of whitespace matches the [String.trim]
  /// functions set of whitespace characters which goes
  /// beyond the standard space, tab and newline to include
  /// unicode characters.
  ///
  static bool isWhitespace(String string) {
    for (final element in string.runes) {
      if (!isWhitespaceRune(element)) {
        return false;
      }
    }
    return true;
  }

  /// True if the passed rune is a whitespace character.
  /// Our definition of whitespace matches the [String.trim]
  /// functions set of whitespace characters which goes
  /// beyond the standard space, tab and newline to include
  /// unicode characters.
  static bool isWhitespaceRune(int rune) =>
      (rune >= 0x0009 && rune <= 0x000D) ||
      rune == 0x0020 ||
      rune == 0x0085 ||
      rune == 0x00A0 ||
      rune == 0x1680 ||
      rune == 0x180E ||
      (rune >= 0x2000 && rune <= 0x200A) ||
      rune == 0x2028 ||
      rune == 0x2029 ||
      rune == 0x202F ||
      rune == 0x205F ||
      rune == 0x3000 ||
      rune == 0xFEFF;

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
  static bool isUpperCase(String? string) {
    if (string == null) {
      return true;
    }
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

  /// Returns true if the string starts with the lower case character; otherwise
  /// false;
  ///
  /// Example:
  ///     print(startsWithLowerCase("camelCase"));
  ///     => true
  ///
  ///     print(startsWithLowerCase(""));
  ///     => false
  static bool startsWithLowerCase(String? string) {
    if (string == null) {
      return false;
    }
    if (string.isEmpty) {
      return false;
    }

    final characters = Characters(string);
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

  /// Returns true if [string]] starts with the upper case character; otherwise
  /// false;
  ///
  /// Example:
  ///     print(startsWithUpperCase("Dart"));
  ///     => true
  ///
  ///     print(startsWithUpperCase(""));
  ///     => false
  static bool startsWithUpperCase(String? string) {
    if (string == null) {
      return false;
    }
    if (string.isEmpty) {
      return false;
    }

    final characters = Characters(string);
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

  /// Returns a string in the form "UpperCamelCase" or "lowerCamelCase".
  ///
  /// Example:
  ///      print(camelize("dart_vm"));
  ///      => DartVm
  static String toCamelCase(String? string, {bool lower = false}) {
    if (string == null) {
      return '';
    }
    if (string.isEmpty) {
      return string;
    }

    string = string.toLowerCase();
    var capitlize = true;
    var position = 0;
    var remove = false;
    final sb = StringBuffer();
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

  // toCapitalised
  static String toCapitalised(String? string) {
    if (string == null || string.isEmpty) {
      return '';
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  /// toPropoerCase
  static String toProperCase(String? sentence) {
    if (sentence == null) {
      return '';
    }
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

// toSnakeCase
  static String toSnakeCase(String? string) {
    if (string == null || string.isEmpty) {
      return '';
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
}
