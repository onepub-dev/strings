// ignore_for_file: avoid_classes_with_only_static_members

class Empty {
  /// true if the [value] is null, or is a zero length String
  static bool isEmpty(String? value) {
    if (value == null) {
      return true;
    }
    return value.isEmpty;
  }

  /// true if the [value] is not null and is not a zero length String
  static bool isNotEmpty(String? value) => !isEmpty(value);

  /// If [value] is not null, then return [value]
  /// If [value] is null the [elseValue] is returned
  /// Rather than using this function you could just call:
  /// value ?? elseValue;
  static String orElse(String? value, String elseValue) => value ?? elseValue;

  /// If [value] is not null, then return [value]
  /// If [value] is null call [elseValue] and return the result.
  /// Rather than using this function you could just call:
  /// value ?? elseValue();
  static String orElseCall(String? value, String Function() elseValue) =>
      value ?? elseValue();

  /// If [value] is null we return a zero length string
  /// otherwise we return [value].
  static String toEmpty(String? value) {
    if (value == null) {
      return '';
    } else {
      return value;
    }
  }
}
