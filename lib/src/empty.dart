// ignore_for_file: avoid_classes_with_only_static_members

class Empty {
  /// true if the [string] is null, or is a zero length String
  static bool isEmpty(String? string) {
    if (string == null) {
      return true;
    }
    return string.isEmpty;
  }

  /// true if the [string] is not null and is not a zero length String
  static bool isNotEmpty(String? string) => !isEmpty(string);

  /// If [string] is not null, then return [string]
  /// If [string] is null the [elseValue] is returned
  /// Rather than using this function you could just call:
  /// value ?? elseValue;
  static String orElse(String? string, String elseValue) => string ?? elseValue;

  /// If [string] is not null, then return [string]
  /// If [string] is null call [elseValue] and return the result.
  /// Rather than using this function you could just call:
  /// value ?? elseValue();
  static String orElseCall(String? string, String Function() elseValue) =>
      string ?? elseValue();

  /// If [string] is null we return a zero length string
  /// otherwise we return [string].
  static String toEmpty(String? string) {
    if (string == null) {
      return '';
    } else {
      return string;
    }
  }
}
