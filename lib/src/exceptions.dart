class StringsException implements Exception {
  StringsException(this.message);
  String message;
}

class IllegalArgumentException extends StringsException {
  IllegalArgumentException(String message) : super(message);
}
