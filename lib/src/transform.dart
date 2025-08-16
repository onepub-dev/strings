import 'package:characters/characters.dart';

import '../strings.dart';
import 'consts.dart';
import 'style.dart';

class Transform {
  /// reverse
  static String reverse(String? string) {
    if (string == null) {
      return '';
    }
    if (string.length < 2) {
      return string;
    }

    final characters = Characters(string);
    return characters.toList().reversed.join();
  }

  /// toEscape
  static String toEscape(
    String? string, {
    String Function(int charCode)? encode,
  }) {
    if (string == null || string.isEmpty) {
      return '';
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
            case 10:
              sb.write(r'\n');
            case 13:
              sb.write(r'\r');
            default:
              sb.write(encode(c));
          }
        } else if (c >= asciiStart && c <= asciiEnd) {
          switch (c) {
            case 34:
              sb.write(r'\"');
            case 36:
              sb.write(r'\$');
            case 39:
              sb.write(r"\'");
            case 92:
              sb.write(r'\\');
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

  /// Returns an unescaped printable string.
  ///
  /// Example:
  ///     print(toPrintable("Hello 'world' \n"));
  ///     => Hello 'world' \n
  static String toPrintable(String? string) {
    if (string == null || string.isEmpty) {
      return '';
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
            case 10:
              sb.write(r'\n');
            case 13:
              sb.write(r'\r');
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

  /// toUnicode
  static String toUnicode(int? charCode) {
    if (charCode == null) {
      return '';
    }
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

  /// Concates a list by inserting [separator] between
  /// each item in the list, except for the last separator
  /// where [last] is used instead.
  static String conjuctionJoin(
    List<String> list, {
    String separator = ', ',
    String last = ' or ',
  }) {
    switch (list.length) {
      case 0:
        return '';
      case 1:
        return list.first;
      default:
        return '''${list.sublist(0, list.length - 1).join(separator)}$last${list.last}''';
    }
  }
}
