class AppException implements Exception {
  //creating constructor

  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  // network request timeout (at 10 secs)
  FetchDataException([String? message, String? prefix])
      : super(
          message,
          "Error during communication\nCouldn't make link with the server",
        );
}

class BadRequestException extends AppException {
  // invalid request : this route or url doesn't exists.
  BadRequestException([String? message])
      : super(message, "Invalid request\nCouldn't route with given url");
}

class UnauthorizedException extends AppException {
  // we get response as token when logging in, which states that this value exists. Here we will check for that.
  UnauthorizedException([String? message])
      : super(message, "Unauthorized request\nCouldn't grant access");
}

class InvalidInputException extends AppException {
  // checking for invalid input.
  InvalidInputException([String? message]) : super(message, "Invalid input");
}
