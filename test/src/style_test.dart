import 'package:strings/strings.dart';
import 'package:test/test.dart';

final List<List<String>> _underscoreCamelCase = <List<String>>[];

final List<List<String>> _underscoreCamelCaseLower = <List<String>>[];
void main() {
  setUpAll(_prepare);

  test('properCase ...', () async {
    expect(Strings.toProperCase(''), equals(''));
    expect(Strings.toProperCase('one'), equals('One'));
    expect(Strings.toProperCase('one two three'), equals('One Two Three'));
    expect(Strings.toProperCase('ONE'), equals('One'));
    expect(Strings.toProperCase('ONE TWO THREE'), equals('One Two Three'));
    // expect(() => Strings.right('one', 3),
    //     throwsA(isA<IndexOutofBoundsException>()));
  });

  test('toCamelCase', () {
    const subject = 'camelize';
    //
    for (var i = 0; i < _underscoreCamelCase.length; i += 2) {
      final source = _underscoreCamelCase[i + 0][1];
      final expected = _underscoreCamelCase[i + 0][0];
      final actual = Strings.toCamelCase(source);
      expect(actual, expected, reason: subject);
    }
    //
    for (var i = 0; i < _underscoreCamelCaseLower.length; i += 2) {
      final source = _underscoreCamelCaseLower[i + 0][1];
      final expected = _underscoreCamelCaseLower[i + 0][0];
      final actual = Strings.toCamelCase(source, lower: true);
      expect(actual, expected, reason: subject);
    }
  });

  test('Capitalize', () {
    const subject = 'capitalize';
    //
    var actual = Strings.toCapitalised('dart core');
    expect(actual, 'Dart core', reason: subject);
    //
    actual = Strings.toCapitalised('x');
    expect(actual, 'X', reason: subject);
    //
    actual = Strings.toCapitalised(' x');
    expect(actual, ' x', reason: subject);
  });

  test('IsLowerCase', () {
    const subject = 'isLowerCase';
    //
    var actual = Strings.isLowerCase('');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isLowerCase('lower_case1');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isLowerCase('UPPER_CASE2');
    expect(actual, false, reason: subject);
    //
    actual = Strings.isLowerCase('Привет');
    expect(actual, false, reason: subject);
    //
    actual = Strings.isLowerCase('пока');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isLowerCase('0️⃣');
    expect(actual, true, reason: subject);
  });

  test('IsUpperCase', () {
    const subject = 'isUpperCase';
    //
    var actual = Strings.isUpperCase('');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isUpperCase('lower_case1');
    expect(actual, false, reason: subject);
    //
    actual = Strings.isUpperCase('UPPER_CASE2');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isUpperCase('Привет');
    expect(actual, false, reason: subject);
    //
    actual = Strings.isUpperCase('ПОКА');
    expect(actual, true, reason: subject);
    //
    actual = Strings.isUpperCase('0️⃣');
    expect(actual, true, reason: subject);
  });

  test('StartsWithLowerCase', () {
    const subject = 'startsWithLowerCase';
    //
    var actual = Strings.startsWithLowerCase('');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithLowerCase('a');
    expect(actual, true, reason: subject);
    //
    actual = Strings.startsWithLowerCase('A');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithLowerCase('Привет');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithLowerCase('пока');
    expect(actual, true, reason: subject);
    //
    actual = Strings.startsWithLowerCase('1');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithLowerCase('0️⃣');
    expect(actual, false, reason: subject);
  });

  test('StartsWithUpperCase', () {
    const subject = 'startsWithUpperCase';
    //
    var actual = Strings.startsWithUpperCase('');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithUpperCase('a');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithUpperCase('A');
    expect(actual, true, reason: subject);
    //
    actual = Strings.startsWithUpperCase('Привет');
    expect(actual, true, reason: subject);
    //
    actual = Strings.startsWithUpperCase('пока');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithUpperCase('1');
    expect(actual, false, reason: subject);
    //
    actual = Strings.startsWithUpperCase('0️⃣');
    expect(actual, false, reason: subject);
  });

  test('Underscore', () {
    const subject = 'underscore';
    //
    for (var i = 0; i < _underscoreCamelCase.length; i += 2) {
      final source = _underscoreCamelCase[i + 0][0];
      final expected = _underscoreCamelCase[i + 0][1];
      final actual = Strings.toSnakeCase(source);
      expect(actual, expected, reason: subject);
    }
  });
}

void _prepare() {
  _underscoreCamelCase.add(['DartVm DartCore', 'dart_vm dart_core']);
  _underscoreCamelCaseLower.add(['dartVm dartCore', 'dart_vm dart_core']);
  _underscoreCamelCase.add([' Dart VM DartCore X', ' dart v_m dart_core x']);
  _underscoreCamelCaseLower
      .add([' dart vM dartCore x', ' dart v_m dart_core x']);
  _underscoreCamelCase.add([' Dart VM Dart1Core X', ' dart v_m dart1_core x']);
  _underscoreCamelCaseLower
      .add([' dart vM dart1Core x', ' dart v_m dart1_core x']);
  _underscoreCamelCase.add([' Dart_Core ', ' dart__core ']);
  _underscoreCamelCaseLower.add([' dart_Core ', ' dart__core ']);
  _underscoreCamelCase.add([' DartVM ', ' dart_v_m ']);
  _underscoreCamelCaseLower.add([' dartVM ', ' dart_v_m ']);
  _underscoreCamelCase.add([' _DartVM ', ' _dart_v_m ']);
  _underscoreCamelCaseLower.add([' _dartVM ', ' _dart_v_m ']);
  _underscoreCamelCase.add(['_DartVM ', '_dart_v_m ']);
  _underscoreCamelCaseLower.add(['_dartVM ', '_dart_v_m ']);
  _underscoreCamelCase.add(['A0️⃣Bc', 'a0️⃣_bc']);
}
