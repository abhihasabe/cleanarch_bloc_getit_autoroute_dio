import 'package:bloc_clean/core/validations/confirm_password_validation.dart';
import 'package:bloc_clean/core/validations/number_validation_dart.dart';
import 'package:bloc_clean/core/validations/password_validation.dart';
import 'package:bloc_clean/core/validations/email_validation.dart';
import 'package:bloc_clean/core/validations/name_validation.dart';
import 'package:formz/formz.dart';

class AuthenticationState with FormzMixin {
  final Name username;
  final Email email;
  final Number phoneNo;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzSubmissionStatus status;
  final Object outPut;

  const AuthenticationState(
      {this.username = const Name.pure(),
      this.email = const Email.pure(),
      this.phoneNo = const Number.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const ConfirmPassword.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.outPut = ""});

  AuthenticationState copyWith(
      {Name? username,
      Email? email,
      Password? password,
      ConfirmPassword? confirmPassword,
      Number? phoneNo,
      FormzSubmissionStatus? status,
      Object? outPut}) {
    return AuthenticationState(
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        status: status ?? this.status,
        outPut: outPut ?? this.outPut);
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs =>
      [username, email, phoneNo, password, confirmPassword];
}
