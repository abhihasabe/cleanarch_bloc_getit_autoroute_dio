import 'package:formz/formz.dart';

enum NameError { invalid, mismatch }

class ConfirmPassword extends FormzInput<String, NameError> {
  final String? password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  const ConfirmPassword.dirty({this.password, String value = ''})
      : super.dirty(value);

  @override
  NameError? validator(String value) {
    print("state.password.value: $password $value");
    return value.isEmpty
        ? null
        : password == value
            ? null
            : NameError.invalid;
  }
}

extension Explanation on NameError {
  String? get name {
    switch (this) {
      case NameError.invalid:
        return 'Passwords not match';
      default:
        return null;
    }
  }
}
