import 'package:formz/formz.dart';

//create enum

enum NumberValidationError { invalid }

//create class to validate email address

class Number extends FormzInput<String, NumberValidationError> {
  const Number.pure([String value = '']) : super.pure(value);

  const Number.dirty([String value = '']) : super.dirty(value);

  static final RegExp _numberRegExp = RegExp(
    r'(^(?:[+0]9)?[0-9]{10,12}$)',
  );

  @override
  NumberValidationError? validator(String value) {
    return value.isEmpty
        ? null
        : value.isNotEmpty == true &&
                value.length >= 10 &&
                _numberRegExp.hasMatch(value)
            ? null
            : NumberValidationError.invalid;
  }
}

extension Explanation on NumberValidationError {
  String? get email {
    switch (this) {
      case NumberValidationError.invalid:
        return "Please enter valid mobile number";
      default:
        return null;
    }
  }
}
