import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
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

  test('abbreviate ...', () async {
    expect(() => Strings.abbreviate('one', 3),
        throwsA(isA<IllegalArgumentException>()));
    expect(Strings.abbreviate('one two', 4), equals('o...'));
    expect(Strings.abbreviate('one two', 5), equals('on...'));
    expect(Strings.abbreviate('one two', 6), equals('one...'));
    expect(Strings.abbreviate('one two', 7), equals('one two'));
  });
}
