import 'empty.dart';

// ignore_for_file: avoid_classes_with_only_static_members

class Blank {
  /// true if the [string] is null or Blank.
  /// A string that only contains whitespace is considered blank.
  /// See: [Empty.isEmpty] to check for a zero length string.
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
}
