// ignore_for_file: avoid_classes_with_only_static_members

import 'package:characters/characters.dart';

import '../strings.dart';
import 'consts.dart';
import 'style.dart';

class Transform {
  /// Returns an unescaped printable string.
  ///
  /// Example:
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello 'world' \n
  static String toPrintable(String string) {
    if (string.isEmpty) {
      return string;
    }

    final sb = StringBuffer();
    final characters = Characters(string);
    for (final s in characters) {
      final runes = s.runes;
      if (runes.length == 1) {
        final c = runes.first;
        if (c >= c0Start && c <= c0End) {
          switch (c) {
            case 9:
              sb.write(r'\t');
              break;
            case 10:
              sb.write(r'\n');
              break;
            case 13:
              sb.write(r'\r');
              break;
            default:
              sb.write(Strings.toUnicode(c));
          }
        } else if (Style.isPrintable(c)) {
          sb.write(s);
        } else {
          sb.write(Strings.toUnicode(c));
        }
      } else {
        // Experimental: Assumes that all clusters can be printed
        sb.write(s);
      }
    }

    return sb.toString();
  }

  /// toPrintableForNull
  static String toPrintableForNull(String? string) => toPrintable(string ?? '');

  /// reverse
  static String reverse(String string) {
    if (string.length < 2) {
      return string;
    }

    final characters = Characters(string);
    return characters.toList().reversed.join();
  }

  /// reverseForNull
  static String reverseForNull(String? string) => reverse(string ?? '');

  /// toUnicode
  static String toUnicode(int charCode) {
    if (charCode < 0 || charCode > unicodeEnd) {
      throw RangeError.range(charCode, 0, unicodeEnd, 'charCode');
    }

    var hex = charCode.toRadixString(16);
    final length = hex.length;
    if (length < 4) {
      hex = hex.padLeft(4, '0');
    }

    return '\\u$hex';
  }

  /// toUnicodeForNull
  static String toUnicodeForNull(int? charCode) {
    if (charCode == null) {
      return '';
    }
    return toUnicode(charCode);
  }

  /// toEscape
  static String toEscape(String string,
      [String Function(int charCode)? encode]) {
    if (string.isEmpty) {
      return string;
    }

    encode ??= Strings.toUnicode;
    final sb = StringBuffer();
    final characters = Characters(string);
    for (final s in characters) {
      final runes = s.runes;
      if (runes.length == 1) {
        final c = runes.first;
        if (c >= c0Start && c <= c0End) {
          switch (c) {
            case 9:
              sb.write(r'\t');
              break;
            case 10:
              sb.write(r'\n');
              break;
            case 13:
              sb.write(r'\r');
              break;
            default:
              sb.write(encode(c));
          }
        } else if (c >= asciiStart && c <= asciiEnd) {
          switch (c) {
            case 34:
              sb.write(r'\"');
              break;
            case 36:
              sb.write(r'\$');
              break;
            case 39:
              sb.write(r"\'");
              break;
            case 92:
              sb.write(r'\\');
              break;
            default:
              sb.write(s);
          }
        } else if (Style.isPrintable(c)) {
          sb.write(s);
        } else {
          sb.write(encode(c));
        }
      } else {
        // Experimental: Assumes that all clusters does not need to be escaped
        sb.write(s);
      }
    }

    return sb.toString();
  }

  /// toEscapeForNull

  static String toEscapeForNull(String? string,
          [String Function(int charCode)? encode]) =>
      toEscape(string ?? '', encode);
}
