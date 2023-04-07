import 'package:bloc_clean/core/errors/domain_error.dart';

class NoConnectionError extends Failure {
  NoConnectionError({String message = ''}) : super(message: message);
}
