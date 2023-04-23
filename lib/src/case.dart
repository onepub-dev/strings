// ignore_for_file: avoid_classes_with_only_static_members

class Case {
  static String toCapitalised(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  static String toCapitalisedForNull(String? value) =>
      value == null ? '' : toCapitalised(value);
}
