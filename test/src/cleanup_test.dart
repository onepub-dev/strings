import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  group('countMatches', () {
    final cases = <(String?, String?, int)>[
      (null, null, 0),
      (null, 'a', 0),
      ('', '', 0),
      ('', 'a', 0),
      ('abc', null, 0),
      ('abc', '', 0),
      ('abc', 'longer', 0),
      ('abc', 'ABC', 0),
      ('aaaaa', 'aa', 2),
      ('ababa', 'aba', 1),
      ('a.*b.*', '.*', 2),
      ('abc', 'abc', 1),
      ('aaa', 'a', 3),
      ('😀😀', '😀', 2),
      ('👩‍💻👩‍💻', '👩‍💻', 2),
      ('e\u0301e\u0301', 'e\u0301', 2),
      ('é', 'e\u0301', 0),
      ('😀😀', '\uD83D', 2),
      ('e\u0301', '\u0301', 1),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('literal case $i', () {
        final (input, search, count) = cases[i];
        expect(Strings.countMatches(input, search), count);
        if (input != null) {
          expect(input.countMatches(search), count);
        }
      });
    }
  });

  group('substring extraction', () {
    final cases = <(String?, String?, String, String, String)>[
      (null, null, '', '', ''),
      (null, '=', '', '', ''),
      ('', '', '', '', ''),
      ('', '=', '', '', ''),
      ('abc', null, '', '', 'abc'),
      ('abc', '', '', '', 'abc'),
      ('abc', 'longer', '', '', 'abc'),
      ('abc', 'ABC', '', '', 'abc'),
      ('abc', 'abc', '', '', ''),
      ('=a=', '=', 'a=', '', '=a'),
      ('a=b=c', '=', 'b=c', 'c', 'a=b'),
      ('aaa', 'aa', 'a', '', 'a'),
      ('a.*b.*c', '.*', 'b.*c', 'c', 'a.*b'),
      ('😀::👩‍💻', '::', '👩‍💻', '👩‍💻', '😀'),
      ('a😀b😀c', '😀', 'b😀c', 'c', 'a😀b'),
      ('ae\u0301b', 'e\u0301', 'b', 'b', 'a'),
      ('aéb', 'e\u0301', '', '', 'aéb'),
      ('😀', '\uD83D', '\uDE00', '\uDE00', ''),
      ('e\u0301', '\u0301', '', '', 'e'),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('literal case $i', () {
        final (input, separator, after, afterLast, beforeLast) = cases[i];
        expect(Strings.substringAfter(input, separator), after);
        expect(Strings.substringAfterLast(input, separator), afterLast);
        expect(Strings.substringBeforeLast(input, separator), beforeLast);
        if (input != null) {
          expect(input.substringAfter(separator), after);
          expect(input.substringAfterLast(separator), afterLast);
          expect(input.substringBeforeLast(separator), beforeLast);
        }
      });
    }
  });

  group('normalizeSpace', () {
    final cases = <(String?, String)>[
      (null, ''),
      ('', ''),
      (' \t\n\r ', ''),
      ('abc', 'abc'),
      (' a  b\tc\r\nd ', 'a b c d'),
      ('a b', 'a b'),
      ('\u00A0😀\t👩‍💻\u3000e\u0301\uFEFF', '😀 👩‍💻 e\u0301'),
      ('a\u200Bb', 'a\u200Bb'),
      ('\uD83D x \uDE00', '\uD83D x \uDE00'),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('text case $i', () {
        final (input, expected) = cases[i];
        expect(Strings.normalizeSpace(input), expected);
        expect(Strings.normalizeSpace(expected), expected);
        if (input != null) {
          expect(input.normalizeSpace(), expected);
        }
      });
    }
    const whitespace = [
      0x09,
      0x0A,
      0x0B,
      0x0C,
      0x0D,
      0x20,
      0x85,
      0xA0,
      0x1680,
      0x180E,
      0x2000,
      0x2001,
      0x2002,
      0x2003,
      0x2004,
      0x2005,
      0x2006,
      0x2007,
      0x2008,
      0x2009,
      0x200A,
      0x2028,
      0x2029,
      0x202F,
      0x205F,
      0x3000,
      0xFEFF,
    ];
    for (final rune in whitespace) {
      test('whitespace U+${rune.toRadixString(16)}', () {
        final space = String.fromCharCode(rune);
        final input = '${space}a$space${space}b$space';
        expect(Strings.isWhitespaceRune(rune), isTrue);
        expect(Strings.normalizeSpace(input), 'a b');
        expect(input.normalizeSpace(), 'a b');
      });
    }
  });

  group('replaceLineEndings', () {
    final cases = <(String?, String)>[
      (null, ''),
      ('', ''),
      ('plain', 'plain'),
      ('\r\n', '\n'),
      ('\r\r\n\n\r', '\n\n\n\n'),
      ('a\r\nb\rc\nd\u0085e\u000Cf\u2028g\u2029', 'a\nb\nc\nd\ne\nf\ng\n'),
      ('a\u000Bb\t c', 'a\u000Bb\t c'),
      ('😀\r\n👩‍💻\ne\u0301', '😀\n👩‍💻\ne\u0301'),
      ('\uD83D\n\uDE00', '\uD83D\n\uDE00'),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('text case $i', () {
        final (input, expected) = cases[i];
        expect(Strings.replaceLineEndings(input), expected);
        if (input != null) {
          expect(input.replaceLineEndings(), expected);
        }
      });
    }
    for (final ending in [
      '\r\n',
      '\r',
      '\n',
      '\u0085',
      '\u000C',
      '\u2028',
      '\u2029',
    ]) {
      test('custom replacements for ${ending.codeUnits}', () {
        final input = 'a${ending}b$ending';
        for (final replacement in <String?>[
          null,
          '',
          '|',
          '\r\n',
          r'$1\n',
          '😀',
        ]) {
          final expected = 'a${replacement ?? ''}b${replacement ?? ''}';
          expect(
            Strings.replaceLineEndings(input, replacement: replacement),
            expected,
          );
          expect(input.replaceLineEndings(replacement: replacement), expected);
          expect(
            Strings.replaceLineEndings(null, replacement: replacement),
            '',
          );
        }
      });
    }
  });
}
