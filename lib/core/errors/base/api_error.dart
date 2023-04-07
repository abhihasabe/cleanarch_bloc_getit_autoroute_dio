import 'package:bloc_clean/core/errors/domain_error.dart';

class ApiError extends Failure {
  ApiError({String message = ''}) : super(message: message);
}
