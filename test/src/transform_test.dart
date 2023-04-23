import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('abbreviate ...', () async {
    expect(() => Strings.abbreviate('one', 3),
        throwsA(isA<IllegalArgumentException>()));
    expect(Strings.abbreviate('one two', 4), equals('o...'));
    expect(Strings.abbreviate('one two', 5), equals('on...'));
    expect(Strings.abbreviate('one two', 6), equals('one...'));
    expect(Strings.abbreviate('one two', 7), equals('one two'));
  });

  test('Escape', () {
    const subject = 'escape';
    //
    var actual = Strings.toEscaped(String.fromCharCode(0));
    expect(actual, r'\u0000', reason: subject);
    actual = Strings.toEscaped('\t');
    expect(actual, r'\t', reason: subject);
    actual = Strings.toEscaped('\n');
    expect(actual, r'\n', reason: subject);
    actual = Strings.toEscaped('\r');
    expect(actual, r'\r', reason: subject);
    actual = Strings.toEscaped('"');
    expect(actual, r'\"', reason: subject);
    actual = Strings.toEscaped(r'$');
    expect(actual, r'\$', reason: subject);
    actual = Strings.toEscaped("'");
    expect(actual, r"\'", reason: subject);
    actual = Strings.toEscaped(r'\');
    expect(actual, r'\\', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(31));
    expect(actual, r'\u001f', reason: subject);
    actual = Strings.toEscaped('hello');
    expect(actual, 'hello', reason: subject);
    actual = Strings.toEscaped('Привет');
    expect(actual, 'Привет', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0x80));
    expect(actual, r'\u0080', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0x9f));
    expect(actual, r'\u009f', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0xa0));
    expect(actual, String.fromCharCode(0xa0), reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0xa1));
    expect(actual, '¡', reason: subject);
    actual = Strings.toEscaped(r'C:\Windows');
    expect(actual, r'C:\\Windows', reason: subject);
    actual = Strings.toEscaped(r'\u0001');
    expect(actual, r'\\u0001', reason: subject);
    // invalid characters
    actual = Strings.toEscaped(String.fromCharCode(0xb5e));
    expect(actual, r'\u0b5e', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0x10ffff));
    expect(actual, r'\u10ffff', reason: subject);
    // Emoji
    actual = Strings.toPrintable('Keycap: 0 Emoji 0️⃣.');
    expect(actual, 'Keycap: 0 Emoji 0️⃣.', reason: subject);
  });

  test('Join', () {
    const subject = 'join';
    //
    var actual = Strings.join([]);
    expect(actual, '', reason: subject);
    //
    actual = Strings.join([1, 2]);
    expect(actual, '12', reason: subject);
    //
    actual = Strings.join([1, 2], ', ');
    expect(actual, '1, 2', reason: subject);
  });

  test('Reverse', () {
    const subject = 'reverse';
    //
    var actual = Strings.reverse('hello');
    expect(actual, 'olleh', reason: subject);
    //
    actual = Strings.reverse('00️⃣1');
    expect(actual, '10️⃣0', reason: subject);
  });

  test('ToPrintable', () {
    const subject = 'toPrintable';
    //
    var actual = Strings.toPrintable(String.fromCharCode(0));
    expect(actual, r'\u0000', reason: subject);
    actual = Strings.toPrintable('\t');
    expect(actual, r'\t', reason: subject);
    actual = Strings.toPrintable('\n');
    expect(actual, r'\n', reason: subject);
    actual = Strings.toPrintable('\r');
    expect(actual, r'\r', reason: subject);
    actual = Strings.toPrintable('"');
    expect(actual, '"', reason: subject);
    actual = Strings.toPrintable(r'$');
    expect(actual, r'$', reason: subject);
    actual = Strings.toPrintable("'");
    expect(actual, "'", reason: subject);
    actual = Strings.toPrintable(r'\');
    expect(actual, r'\', reason: subject);
    actual = Strings.toPrintable(String.fromCharCode(31));
    expect(actual, r'\u001f', reason: subject);
    actual = Strings.toPrintable('hello');
    expect(actual, 'hello', reason: subject);
    actual = Strings.toPrintable('Привет');
    expect(actual, 'Привет', reason: subject);
    actual = Strings.toPrintable(String.fromCharCode(0x80));
    expect(actual, r'\u0080', reason: subject);
    actual = Strings.toPrintable(String.fromCharCode(0x9f));
    expect(actual, r'\u009f', reason: subject);
    actual = Strings.toPrintable(String.fromCharCode(0xa0));
    expect(actual, String.fromCharCode(0xa0), reason: subject);
    actual = Strings.toPrintable(String.fromCharCode(0xa1));
    expect(actual, '¡', reason: subject);
    actual = Strings.toPrintable(r'C:\Windows');
    expect(actual, r'C:\Windows', reason: subject);
    actual = Strings.toPrintable(r'\u0001');
    expect(actual, r'\u0001', reason: subject);
    // invalid characters
    actual = Strings.toEscaped(String.fromCharCode(0xb5e));
    expect(actual, r'\u0b5e', reason: subject);
    actual = Strings.toEscaped(String.fromCharCode(0x10ffff));
    expect(actual, r'\u10ffff', reason: subject);
    // Emoji
    actual = Strings.toPrintable('Keycap: 0 Emoji 0️⃣.');
    expect(actual, 'Keycap: 0 Emoji 0️⃣.', reason: subject);
  });

  test('ToUnicode', () {
    const subject = 'toUnicode';
    //
    var actual = Strings.toUnicode(32);
    expect(actual, r'\u0020', reason: subject);
    //
    actual = Strings.toUnicode(127);
    expect(actual, r'\u007f', reason: subject);
  });
}
