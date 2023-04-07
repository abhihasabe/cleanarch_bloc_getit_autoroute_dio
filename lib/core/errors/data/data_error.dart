import 'package:bloc_clean/core/errors/domain_error.dart';

abstract class DataError extends Failure {
  const DataError._({String message = ''}) : super(message: message);

  factory DataError.failedToConvert({String message = ''}) => _FailedToConvert(message: message);
  factory DataError.missingParameters({String message = ''}) => _MissingParameters(message: message);
}

class _FailedToConvert extends DataError {
  _FailedToConvert({String message = ''}) : super._(message: message);
}

class _MissingParameters extends DataError {
  _MissingParameters({String message = ''}) : super._(message: message);
}
