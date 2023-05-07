import '../strings.dart';

extension Safe on Strings {
  /// Refer to [String.length]
  ///
  /// If [string] is null then it is treated as an empty String
  static int length(String? string) => (string ?? '').length;

  /// Refer to [String.codeUnits]
  ///
  /// If [string] is null then it is treated as an empty String
  static List<int> codeUnits(String? string) => (string ?? '').codeUnits;

  /// Refer to [String.runes]
  ///
  /// If [string] is null then it is treated as an empty String
  static Runes runes(String? string) => (string ?? '').runes;

  /// Refer to [String.allMatches]
  ///
  /// If [string] is null then it is treated as an empty String
  static Iterable<Match> allMatches(String? pattern, String string,
          [int start = 0]) =>
      (pattern ?? '').allMatches(string, start);

  /// Refer to [String.codeUnitAt]
  ///
  /// If [string] is null it is treated as an empty string which will result
  /// in an IndexOutOfBoundsException
  static int codeUnitAt(String? string, int index) =>
      (string ?? '').codeUnitAt(index);

  /// Refer to [String.compareTo]
  ///
  /// This method has special handling for a null [string] or [other].
  /// If both are null then we return -1
  /// If one of them is null then we use [nullIsLessThan] to determine if
  /// we return -1  or 1.
  static int compareTo(String? string, String? other,
      {bool nullIsLessThan = true}) {
    if (string == other) {
      return 0;
    }
    if (string == null) {
      return nullIsLessThan ? -1 : 1;
    }
    if (other == null) {
      return nullIsLessThan ? 1 : -1;
    }
    return string.compareTo(other);
  }

  /// Refer to [String.contains]
  ///
  /// If [string] is null then it is treated as an empty String
  static bool contains(String? string, Pattern other, [int startIndex = 0]) =>
      (string ?? '').contains(other, startIndex);

  /// Refer to [String.endsWith]
  static bool endsWith(String? string, String? other) {
    if (string == null || other == null) {
      return false;
    }

    return string.endsWith(other);
  }

  /// Refer to [String.indexOf]
  ///
  /// If [string] is null then it is treated as an empty String
  static int indexOf(String? string, Pattern pattern, [int start = 0]) =>
      (string ?? '').indexOf(pattern, start);

  /// Refer to [String.lastIndexOf]
  ///
  /// If [string] is null then it is treated as an empty String
  static int lastIndexOf(String? string, Pattern pattern, [int? start]) =>
      (string ?? '').lastIndexOf(pattern, start);

  /// Refer to [String.matchAsPrefix]
  ///
  /// If [string] is null then it is treated as an empty String
  static Match? matchAsPrefix(String? pattern, String string,
          [int start = 0]) =>
      (pattern ?? '').matchAsPrefix(string, start);

  /// Refer to [String.padLeft]
  ///
  /// If [string] is null then it is treated as an empty String
  static String padLeft(String? string, int width, [String padding = ' ']) =>
      (string ?? '').padLeft(width, padding);

  /// Refer to [String.padRight]
  ///
  /// If [string] is null then it is treated as an empty String
  static String padRight(String? string, int width, [String padding = ' ']) =>
      (string ?? '').padRight(width, padding);

  /// Refer to [String.replaceAll]
  ///
  /// If [string] is null then it is treated as an empty String
  static String replaceAll(String? string, Pattern from, String replace) =>
      (string ?? '').replaceAll(from, replace);

  /// Refer to [String.replaceAllMapped]
  ///
  /// If [string] is null then it is treated as an empty String
  static String replaceAllMapped(
          String? string, Pattern from, String Function(Match match) replace) =>
      (string ?? '').replaceAllMapped(from, replace);

  /// Refer to [String.replaceFirst]
  ///
  /// If [string] is null then it is treated as an empty String
  static String replaceFirst(String? string, Pattern from, String to,
          [int startIndex = 0]) =>
      (string ?? '').replaceFirst(from, to, startIndex);

  /// Refer to [String.replaceFirstMapped]
  ///
  /// If [string] is null then it is treated as an empty String
  static String replaceFirstMapped(
          String? string, Pattern from, String Function(Match match) replace,
          [int startIndex = 0]) =>
      (string ?? '').replaceFirstMapped(from, replace, startIndex);

  /// Refer to [String.replaceRange]
  ///
  /// If [string] is null then it is treated as an empty String
  static String replaceRange(
          String? string, int start, int? end, String replacement) =>
      (string ?? '').replaceRange(start, end, replacement);

  /// Refer to [String.split]
  ///
  /// If [string] is null then it is treated as an empty String
  static List<String> split(String? string, Pattern pattern) =>
      (string ?? '').split(pattern);

  /// Refer to [String.splitMapJoin]
  ///
  /// If [string] is null then it is treated as an empty String
  static String splitMapJoin(String? string, Pattern pattern,
          {String Function(Match)? onMatch,
          String Function(String)? onNonMatch}) =>
      (string ?? '')
          .splitMapJoin(pattern, onMatch: onMatch, onNonMatch: onNonMatch);

  /// Refer to [String.startsWith]
  ///
  /// If [string] is null then it is treated as an empty String
  static bool startsWith(String? string, Pattern pattern, [int index = 0]) =>
      (string ?? '').startsWith(pattern, index);

  /// Refer to [String.substring]
  ///
  /// If [string] is null then it is treated as an empty String
  static String substring(String? string, int start, [int? end]) {
    if (string == null) {
      return ' ' * ((end ?? start + 1) - start);
    }
    return string.substring(start, end);
  }

  /// Refer to [String.toLowerCase]
  ///
  /// If [string] is null then it is treated as an empty String
  static String toLowerCase(String? string) => (string ?? '').toLowerCase();

  /// Refer to [String.toUpperCase]
  ///
  /// If [string] is null then it is treated as an empty String
  static String toUpperCase(String? string) => (string ?? '').toUpperCase();

  /// Refer to [String.trim]
  ///
  /// If [string] is null then it is treated as an empty String
  static String trim(String? string) => (string ?? '').trim();

  /// Refer to [String.trimLeft]
  ///
  /// If [string] is null then it is treated as an empty String
  static String trimLeft(String? string) => (string ?? '').trimLeft();

  /// Refer to [String.trimRight]
  ///
  /// If [string] is null then it is treated as an empty String
  static String trimRight(String? string) => (string ?? '').trimRight();
}
