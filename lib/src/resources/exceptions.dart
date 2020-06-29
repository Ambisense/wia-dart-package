class WiaHttpException implements Exception {
  int statusCode;
  String message;

  WiaHttpException(int _statusCode, String _message) {
    this.statusCode = _statusCode;
    this.message = _message;
  }

  @override
  String toString() {
    return message;
  }
}
