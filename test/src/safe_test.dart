import 'package:strings/strings.dart';
import 'package:test/test.dart';

void main() {
  test('safe ...', () async {
    expect(Strings.padLeft('start', 10), '     start');

    expect(Strings.substring(null, 1, 3), '  ');
    expect(Strings.substring(null, 1), ' ');
  });
}
