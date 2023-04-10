import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends AuthenticationEvent {
  const UsernameChanged({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class EmailChanged extends AuthenticationEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNoChanged extends AuthenticationEvent {
  const PhoneNoChanged({required this.phoneNo});

  final String phoneNo;

  @override
  List<Object> get props => [phoneNo];
}

class PasswordChanged extends AuthenticationEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends AuthenticationEvent {
  const ConfirmPasswordChanged({required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class LoggedIn extends AuthenticationEvent {
  const LoggedIn({required this.email, required this.password});

  final String email;
  final String password;
}

class RegistrationState extends AuthenticationEvent {
  const RegistrationState();
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
