import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return value.isEmpty
        ? null
        : value.length > 7 //_passwordRegex.hasMatch(value ?? '')
            ? null
            : PasswordValidationError.invalid;
  }
}

extension Explanation on PasswordValidationError {
  String? get password {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'Password must be at least 8 characters and contain at least one letter and number';
      default:
        return null;
    }
  }
}
