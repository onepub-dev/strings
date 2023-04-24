import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('extension ...', () async {
    expect('123'.isNumeric(), true);
    expect('abc'.isLowerCase(), true);
    expect('ABC'.isUpperCase(), true);
    expect('abCD'.toSnakeCase(), 'ab_c_d');
    expect('aBC'.startsWithLowerCase(), true);
    expect('aBC'.startsWithUpperCase(), false);
    expect('one'.right(2), 'ne');
    expect('one'.left(2), 'on');
    expect('abbreviate'.abbreviate(5), 'ab...');
    expect('ab'.reverse(), 'ba');
    expect('ab'.toProperCase(), 'Ab');
    expect('abc_def'.toCamelCase(), 'AbcDef');
    expect('abc'.toCapitalised(), 'Abc');
    expect('\n'.toPrintable(), r'\n');
  });
}
