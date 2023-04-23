import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('isBlank ...', () async {
    expect(Strings.isBlank(null), isTrue);
    expect(Strings.isBlank('  '), isTrue);
    expect(Strings.isBlank('abc'), isFalse);
  });

  test('isNotBlank ...', () async {
    expect(Strings.isNotBlank(null), isFalse);
    expect(Strings.isNotBlank('  '), isFalse);
    expect(Strings.isNotBlank('abc'), isTrue);
  });
}
