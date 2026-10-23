import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  group('literal affix removal', () {
    final cases = <(String?, String?, String, String)>[
      (null, null, '', ''),
      (null, 'x', '', ''),
      ('', '', '', ''),
      ('', 'x', '', ''),
      ('text', null, 'text', 'text'),
      ('text', '', 'text', 'text'),
      ('text', 'missing', 'text', 'text'),
      ('text', 'text', '', ''),
      ('text', 'TEXT', 'text', 'text'),
      ('aaa', 'a', 'aa', 'aa'),
      ('abc', 'ab', 'c', 'abc'),
      ('abc', 'bc', 'abc', 'a'),
      ('.*value.*', '.*', 'value.*', '.*value'),
      ('😀value😀', '😀', 'value😀', '😀value'),
      ('👩‍💻value👩‍💻', '👩‍💻', 'value👩‍💻', '👩‍💻value'),
      ('e\u0301valuee\u0301', 'e\u0301', 'valuee\u0301', 'e\u0301value'),
      ('évalueé', 'e\u0301', 'évalueé', 'évalueé'),
      ('😀', '\uD83D', '\uDE00', '😀'),
      ('😀', '\uDE00', '😀', '\uD83D'),
      ('e\u0301', '\u0301', 'e\u0301', 'e'),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('case $i through static and extension APIs', () {
        final (input, affix, prefixResult, suffixResult) = cases[i];
        expect(Strings.removePrefix(input, affix), prefixResult);
        expect(Strings.removeSuffix(input, affix), suffixResult);
        if (input != null) {
          expect(input.removePrefix(affix), prefixResult);
          expect(input.removeSuffix(affix), suffixResult);
        }
      });
    }
  });

  group('literal partition', () {
    final cases = <(String?, String?, List<String>, List<String>)>[
      (null, null, ['', '', ''], ['', '', '']),
      (null, '=', ['', '', ''], ['', '', '']),
      ('', '', ['', '', ''], ['', '', '']),
      ('', '=', ['', '', ''], ['', '', '']),
      ('text', null, ['text', '', ''], ['', '', 'text']),
      ('text', '', ['text', '', ''], ['', '', 'text']),
      ('text', 'longer', ['text', '', ''], ['', '', 'text']),
      ('text', 'TEXT', ['text', '', ''], ['', '', 'text']),
      ('text', 'text', ['', 'text', ''], ['', 'text', '']),
      ('=a=', '=', ['', '=', 'a='], ['=a', '=', '']),
      ('a=b=c', '=', ['a', '=', 'b=c'], ['a=b', '=', 'c']),
      ('aaa', 'aa', ['', 'aa', 'a'], ['a', 'aa', '']),
      ('a.*b.*c', '.*', ['a', '.*', 'b.*c'], ['a.*b', '.*', 'c']),
      ('😀::👩‍💻', '::', ['😀', '::', '👩‍💻'], ['😀', '::', '👩‍💻']),
      ('a😀b😀c', '😀', ['a', '😀', 'b😀c'], ['a😀b', '😀', 'c']),
      ('ae\u0301b', 'e\u0301', ['a', 'e\u0301', 'b'], ['a', 'e\u0301', 'b']),
      ('aéb', 'e\u0301', ['aéb', '', ''], ['', '', 'aéb']),
      ('😀', '\uD83D', ['', '\uD83D', '\uDE00'], ['', '\uD83D', '\uDE00']),
      ('e\u0301', '\u0301', ['e', '\u0301', ''], ['e', '\u0301', '']),
    ];
    for (var i = 0; i < cases.length; i++) {
      test('case $i through static and extension APIs', () {
        final (input, separator, first, last) = cases[i];
        final actualFirst = Strings.partition(input, separator);
        final actualLast = Strings.lastPartition(input, separator);
        expect(actualFirst, first);
        expect(actualLast, last);
        expect(actualFirst.join(), input ?? '');
        expect(actualLast.join(), input ?? '');
        if (input != null) {
          expect(input.partition(separator), first);
          expect(input.lastPartition(separator), last);
        }
      });
    }
  });
}
