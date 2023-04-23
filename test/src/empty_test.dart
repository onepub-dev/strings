import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('nullToEmpty ...', () async {
    expect(Strings.toEmpty(null), equals(''));
    expect(Strings.toEmpty('abc'), equals('abc'));
  });

  test('isEmpty ...', () async {
    expect(Strings.isEmpty(null), isTrue);
    expect(Strings.isEmpty('  '), isFalse);
    expect(Strings.isEmpty('abc'), isFalse);
  });

  test('isNotEmpty ...', () async {
    expect(Strings.isNotEmpty(null), isFalse);
    expect(Strings.isNotEmpty('  '), isTrue);
    expect(Strings.isNotEmpty('abc'), isTrue);
  });
}
