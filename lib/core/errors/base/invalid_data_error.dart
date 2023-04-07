import 'package:bloc_clean/core/errors/domain_error.dart';

class InvalidDataError extends Failure {
  InvalidDataError({String message = ''}) : super(message: message);
}
