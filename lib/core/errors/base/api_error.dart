import 'package:bloc_clean/core/errors/domain_error.dart';

class ApiError extends DomainError {
  ApiError({String message = ''}) : super(message: message);
}
