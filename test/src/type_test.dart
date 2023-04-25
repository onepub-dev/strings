import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('isNumeric ...', () async {
    expect(Strings.isNumeric(null), isFalse);
    expect(Strings.isNumeric(''), isFalse);
    expect(Strings.isNumeric('x'), isFalse);
    expect(Strings.isNumeric('123x'), isFalse);
    expect(Strings.isNumeric('123'), isTrue);
    expect(Strings.isNumeric('+123'), isTrue);
    expect(Strings.isNumeric('123.456'), isTrue);
    // expect(Strings.isNumeric('1,234.567'), isTrue);
    // expect(Strings.isNumeric('1.234,567'), isTrue);
    expect(Strings.isNumeric('-123'), isTrue);
    expect(Strings.isNumeric(double.infinity.toString()), isFalse);
    expect(Strings.isNumeric(double.nan.toString()), isFalse);
    expect(Strings.isNumeric('0x123'), isFalse);
  });

  test('isAscii', () {
    expect(Strings.isAscii('a'), true);
    expect(
        Strings.isAscii('the quick brown fox jumped over the lazy dog'), true);
  });
}
