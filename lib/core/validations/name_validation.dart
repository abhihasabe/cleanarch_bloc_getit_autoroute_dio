import 'package:formz/formz.dart';

enum NameError { empty, invalid }

class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  NameError? validator(String value) {
    return value.isEmpty
        ? null
        : value.isNotEmpty == true &&
                value.length > 3 &&
                _nameRegExp.hasMatch(value)
            ? null
            : NameError.invalid;
  }
}

extension Explanation on NameError {
  String? get name {
    switch (this) {
      case NameError.invalid:
        return "This is not a valid name";
      default:
        return null;
    }
  }
}
