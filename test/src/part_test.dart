import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('abbreviate ...', () async {
    expect(Strings.abbreviate(null, 4), equals(''));
    expect(Strings.abbreviate('one', 3), 'one');
    expect(Strings.abbreviate('one two', 4), equals('o...'));
    expect(Strings.abbreviate('one two', 5), equals('on...'));
    expect(Strings.abbreviate('one two', 6), equals('one...'));
    expect(Strings.abbreviate('one two', 7), equals('one two'));
  });

  test('join ...', () async {
    const subject = 'join';

    expect(Strings.join(['a', 'b', 'c']), equals('abc'));
    expect(Strings.join(null), equals(''));
    expect(Strings.join([null, 'b', 'c']), equals('bc'));
    expect(Strings.join([null, 'b', 'c'], separator: ','), equals(',b,c'));

    //
    var actual = Strings.join([]);
    expect(actual, '', reason: subject);
    //
    actual = Strings.join([1, 2]);
    expect(actual, '12', reason: subject);
    //
    actual = Strings.join([1, 2], separator: ', ');
    expect(actual, '1, 2', reason: subject);

    // empty elements
    expect(Strings.join(['a', 'b', 'c'], excludeEmpty: true), equals('abc'));
    expect(Strings.join(['a', '', 'c'], excludeEmpty: true), equals('ac'));
    expect(Strings.join(['a', '', 'c'], separator: ', ', excludeEmpty: true),
        equals('a, c'));
    expect(
        Strings.join(['a', '', 'c', null], separator: ', ', excludeEmpty: true),
        equals('a, c'));

    actual = Strings.join([1, 2, null], separator: ', ', excludeEmpty: true);
    expect(actual, '1, 2', reason: subject);

    actual = Strings.join([1, null, 3], separator: ', ', excludeEmpty: true);
    expect(actual, '1, 3', reason: subject);
  });

  test('left ...', () async {
    expect(Strings.left(null, 2), equals(''));
    expect(Strings.left('one', 0), equals(''));
    expect(Strings.left('one', 1), equals('o'));
    expect(Strings.left('one', 2), equals('on'));
    expect(Strings.left('one', 3), equals('one'));
    expect(Strings.left('one', 4), 'one');
    expect(Strings.left('one', 4, pad: Pad.left), ' one');
    expect(Strings.left('one', 4, pad: Pad.right), 'one ');
  });

  test('right ...', () async {
    expect(Strings.right(null, 2), equals(''));
    expect(Strings.right('one', 0), equals(''));
    expect(Strings.right('one', 1), equals('e'));
    expect(Strings.right('one', 2), equals('ne'));
    expect(Strings.right('one', 3), equals('one'));
    expect(Strings.right('one', 4), 'one');
    expect(Strings.right('one', 4, pad: Pad.left), ' one');
    expect(Strings.right('one', 4, pad: Pad.right), 'one ');
  });

  test('hidePart', () {
    expect(Strings.hidePart('password'), '********');
    expect(Strings.hidePart('password', start: 1), 'p*******');
    expect(Strings.hidePart('password', start: 1, replaceWith: '##'),
        'p##############');
    expect(Strings.hidePart('password', start: 1, end: 2), 'p*ssword');
    expect(Strings.hidePart('password', start: 1, end: 20), 'p*******');
  });
}
