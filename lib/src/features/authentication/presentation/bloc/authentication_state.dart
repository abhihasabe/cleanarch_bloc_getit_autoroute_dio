import 'package:bloc_clean/core/validations/number_validation_dart.dart';
import 'package:bloc_clean/core/validations/password_validation.dart';
import 'package:bloc_clean/core/validations/email_validation.dart';
import 'package:bloc_clean/core/validations/name_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AuthenticationState extends Equatable{
  final Name username;
  final Password password;
  final Email email;
  final Number phoneNo;
  final FormzStatus status;

  const AuthenticationState(
      {this.username = const Name.pure(),
      this.password = const Password.pure(),
      this.email = const Email.pure(),
      this.phoneNo = const Number.pure(),
      this.status = FormzStatus.pure});

  AuthenticationState copyWith(
      {Name? username,
      Password? password,
      Email? email,
      Number? phoneNo,
      FormzStatus? status}) {
    return AuthenticationState(
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [username, password, phoneNo, email, status];
}
