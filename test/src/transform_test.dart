import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('Reverse', () {
    const subject = 'reverse';
    //
    var actual = Strings.reverse('hello');
    expect(actual, 'olleh', reason: subject);
    //
    actual = Strings.reverse('00️⃣1');
    expect(actual, '10️⃣0', reason: subject);
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
  });

  test('toPrintable', () {
    const subject = 'toPrintable';

    // Emoji
    final actual = Strings.toPrintable('Keycap: 0 Emoji 0️⃣.');
    expect(actual, 'Keycap: 0 Emoji 0️⃣.', reason: subject);
    expect('\n'.toPrintable(), r'\n', reason: subject);
    expect(
      '\n\r\tabcdef123'.toPrintable(),
      r'\n\r\tabcdef123',
      reason: subject,
    );
  });

  test('toUnicode', () {
    const subject = 'toUnicode';
    //
    var actual = Strings.toUnicode(32);
    expect(actual, r'\u0020', reason: subject);
    //
    actual = Strings.toUnicode(127);
    expect(actual, r'\u007f', reason: subject);
  });

  group('Transform.orJoin', () {
    test('returns empty string for empty list', () {
      expect(Strings.conjuctionJoin([]), '');
    });

    test('returns single item for a list with one element', () {
      expect(Strings.conjuctionJoin(['A']), 'A');
    });

    test('joins two items with default separator and last', () {
      expect(Strings.conjuctionJoin(['A', 'B']), 'A or B');
    });

    test('joins multiple items with commas and default last', () {
      expect(Strings.conjuctionJoin(['A', 'B', 'C']), 'A, B or C');
    });

    test('uses custom separator and last strings', () {
      final result = Strings.conjuctionJoin(
        ['X', 'Y', 'Z'],
        separator: ' - ',
        conjuction: ' & ',
      );
      expect(result, 'X - Y & Z');
    });
  });
}
