import 'dart:developer' as developer;

class LoggerHelper {
  static void logMessage(String message, {Object? error}) {
    developer.log(message, error: error);
  }

  static void logObject(Object object) {
    logMessage(object.toString());
  }
}
