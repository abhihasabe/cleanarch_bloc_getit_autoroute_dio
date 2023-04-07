import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends AuthenticationEvent {
  final String username;

  const UsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class EmailChanged extends AuthenticationEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PhoneNoChanged extends AuthenticationEvent {
  final String phoneNo;

  const PhoneNoChanged(this.phoneNo);

  @override
  List<Object> get props => [phoneNo];
}

class PasswordChanged extends AuthenticationEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthenticationEvent {
  final String password;

  const ConfirmPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn();
}

class RegistrationState extends AuthenticationEvent {
  const RegistrationState();
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
