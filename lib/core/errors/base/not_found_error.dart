import 'package:bloc_clean/core/errors/domain_error.dart';

class NotFoundError extends Failure {
  NotFoundError({String message = ''}) : super(message: message);
}
