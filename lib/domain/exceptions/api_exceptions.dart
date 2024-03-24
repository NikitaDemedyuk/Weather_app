abstract class ServerException implements Exception {
  const ServerException();
}

class ServerResponseException extends ServerException {
  const ServerResponseException({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  final int statusCode;
  final String message;
  final List<String> errors;

  String getFormattedMessage() {
    if (errors.isNotEmpty) {
      return errors.join('\n');
    }

    if (message.isNotEmpty) {
      return message;
    }

    return '';
  }

  @override
  String toString() => '[$statusCode] : $message ($errors)';
}

class ServerUnknownException extends ServerException {
  const ServerUnknownException();
}

class ConnectionException implements Exception {
  const ConnectionException();
}

class ActionForbiddenException extends ServerException {
  const ActionForbiddenException();
}
