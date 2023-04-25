// ignore_for_file: avoid_classes_with_only_static_members

import 'package:characters/characters.dart';

import 'consts.dart';

class Type {
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

  /// returns true if [string] only contains
  /// ascii characters.
  static bool isAscii(String? string) {
    if (string == null) {
      return false;
    }
    final characters = Characters(string);
    for (final s in characters) {
      final runes = s.runes;
      if (runes.length != 1) {
        return false;
      }
      final c = runes.first;
      if (c < asciiStart || c > asciiEnd) {
        return false;
      }
    }
    return true;
  }
}
