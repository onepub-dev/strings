// ignore_for_file: avoid_classes_with_only_static_members

enum Pad { left, right, none }

class Part {
  /// Abbreviate a string to [maxWidth] by truncating the
  /// string and adding '...' to then truncated string.
  /// ```
  /// Strings.abbreviate('Hello World', 6) == 'Hel...'
  /// ```
  /// Pass an [offset] to to start the abbreviation from the given
  /// [offset].  The returned string will included everything before
  /// the offset plus as well as the abreviate text staring from the offset.
  /// If [maxWidth] is less than 4 then we just truncate the string
  /// to the given width.
  /// If [string] is shorter than maxWidth we just return [string].
  /// If [string] is null we return an empty string.
  static String abbreviate(String? string, int maxWidth, {int offset = 0}) {
    if (string == null) {
      return '';
    }
    final length = string.length;
    if (length <= maxWidth || maxWidth < 4) {
      return string;
    }
    if (offset > length) {
      offset = length;
    }
    if (length - offset < maxWidth - 3) {
      offset = length - (maxWidth - 3);
    }
    const abrevMarker = '...';
    if (offset <= 4) {
      return string.substring(0, maxWidth - 3) + abrevMarker;
    }

    if (offset + maxWidth - 3 < length) {
      return abrevMarker + abbreviate(string.substring(offset), maxWidth - 3);
    }
    return abrevMarker + string.substring(length - (maxWidth - 3));
  }

  /// Returns the joined elements of the [list].
  /// If the [list] is null then an empty String is returned.
  /// If any element in [list] is null it is treated as an empty string
  /// but still included in the list.
  ///
  /// Example:
  ///     print(join(null));
  ///     => ''
  ///
  ///     print(join([1, 2]));
  ///     => 12
  ///     print(join([1, 2], separator: ','));
  ///     => 1,2
  static String join(List<Object?>? list, {String separator = ''}) =>
      list == null ? '' : list.map((element) => element ?? '').join(separator);

  /// Returns the first [len] characters from [string]
  /// If [len] is longer than [string] then the result is padded
  /// according to [pad]
  static String left(String? string, int len, {Pad pad = Pad.none}) {
    string ??= '';

    final length = string.length;
    if (length >= len) {
      return string.substring(0, len);
    }

    final padLength = len - length;

    switch (pad) {
      case Pad.left:
        return "${' ' * padLength}$string";
      case Pad.right:
        return "$string${' ' * padLength}";
      case Pad.none:
        return string;
    }
  }

  /// Returns all characters from [string] starting at [take] inclusive.
  /// If [take] is outside the bounds of [string] then padding
  /// is applied according to [pad].
  static String right(String? string, int take, {Pad pad = Pad.none}) {
    string ??= '';

    final length = string.length;
    if (length >= take) {
      return string.substring(length - take);
    }

    final padLength = take - length;

    switch (pad) {
      case Pad.left:
        return "${' ' * padLength}$string";
      case Pad.right:
        return "$string${' ' * padLength}";
      case Pad.none:
        return string;
    }
  }
}
