class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return _message ?? '';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error Fetching Data: ');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}