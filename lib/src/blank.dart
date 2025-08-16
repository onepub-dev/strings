import 'empty.dart';

class Blank {
  /// true if the [string] is null or Blank.
  /// A string that only contains whitespace is considered blank.
  /// See: [Empty.isEmpty] to check for a null or zero length string.
  static bool isBlank(String? string) {
    if (string == null) {
      return true;
    }
    return string.trim().isEmpty;
  }

  /// true if the [string] is not null and not Blank.
  /// A string containing only whitespace is considered blank.
  /// See: [Empty.isNotEmpty] to check for non-zero length string.
  static bool isNotBlank(String? string) => !isBlank(string);

  /// If the [string] is not blank then we return [string]
  /// otherwise we return [elseString]
  static String orElse(String? string, String elseString) =>
      isNotBlank(string) ? string! : elseString;
}
