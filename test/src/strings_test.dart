import 'package:strings_xxx/strings.dart';
import 'package:test/test.dart';

void main() {
  test('nullToEmpty ...', () async {
    expect(Strings.nullToEmpty(null), equals(''));
    expect(Strings.nullToEmpty('abc'), equals('abc'));
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

  test('orElse ...', () async {
    expect(Strings.orElse(null, 'one'), equals('one'));
    expect(Strings.orElse('', 'one'), equals(''));
  });

  test('right ...', () async {
    expect(Strings.right('one', 0), equals('one'));
    expect(Strings.right('one', 1), equals('ne'));
    expect(Strings.right('one', 2), equals('e'));
    expect(Strings.right('one', 3), equals(''));
    expect(() => Strings.right('one', 4), throwsA(isA<RangeError>()));
  });

  test('left ...', () async {
    expect(Strings.left('one', 0), equals(''));
    expect(Strings.left('one', 1), equals('o'));
    expect(Strings.left('one', 2), equals('on'));
    expect(Strings.left('one', 3), equals('one'));
    expect(() => Strings.left('one', 4), throwsA(isA<RangeError>()));
  });

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

  test('abbreviate ...', () async {
    expect(() => Strings.abbreviate('one', 3),
        throwsA(isA<IllegalArgumentException>()));
    expect(Strings.abbreviate('one two', 4), equals('o...'));
    expect(Strings.abbreviate('one two', 5), equals('on...'));
    expect(Strings.abbreviate('one two', 6), equals('one...'));
    expect(Strings.abbreviate('one two', 7), equals('one two'));
  });

  test('properCase ...', () async {
    expect(Strings.properCase(''), equals(''));
    expect(Strings.properCase('one'), equals('One'));
    expect(Strings.properCase('one two three'), equals('One Two Three'));
    expect(Strings.properCase('ONE'), equals('One'));
    expect(Strings.properCase('ONE TWO THREE'), equals('One Two Three'));
    // expect(() => Strings.right('one', 3),
    //     throwsA(isA<IndexOutofBoundsException>()));
  });

  test('equals ...', () async {
    expect(Strings.equals(null, null), isTrue);
    expect(Strings.equals('one', null), isFalse);
    expect(Strings.equals(null, 'one'), isFalse);
    expect(Strings.equals('one', 'one'), isTrue);
    expect(Strings.equals('one', 'two'), isFalse);
  });
}
