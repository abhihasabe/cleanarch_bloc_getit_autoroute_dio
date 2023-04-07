import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:bloc_clean/core/validations/number_validation_dart.dart';
import 'package:bloc_clean/core/validations/password_validation.dart';
import 'package:bloc_clean/core/validations/email_validation.dart';
import 'package:bloc_clean/core/validations/name_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<UsernameChanged>(usernameChanged);
    on<EmailChanged>(emailChanged);
    on<PhoneNoChanged>(mapPhoneNoChangedToState);
    on<PasswordChanged>(mapPasswordChangedToState);
    on<LoggedIn>(_loggedIn);
    on<RegistrationState>(_registration);
    on<LoggedOut>(_loggedOut);
  }

  usernameChanged(UsernameChanged event, Emitter<AuthenticationState> emit) {
    final name = Name.dirty(event.username);
    emit(const AuthenticationState().copyWith(
        username: name.valid ? name : Name.dirty(event.username),
        status: Formz.validate([name, state.email])));
  }

  emailChanged<AuthenticationEvent>(
      EmailChanged event, Emitter<AuthenticationState> emit) {
    final email = Email.dirty(event.email);
    emit(const AuthenticationState().copyWith(
        email: email.valid ? email : Email.dirty(event.email),
        status: Formz.validate([email, state.phoneNo])));
  }

  mapPhoneNoChangedToState(
      PhoneNoChanged event, Emitter<AuthenticationState> emit) {
    final phoneNo = Number.dirty(event.phoneNo);
    emit(const AuthenticationState().copyWith(
        phoneNo: phoneNo.valid ? phoneNo : Number.dirty(event.phoneNo),
        status: Formz.validate([phoneNo, state.password])));
  }

  mapPasswordChangedToState(
      PasswordChanged event, Emitter<AuthenticationState> emit) {
    final password = Password.dirty(event.password);
    emit(const AuthenticationState().copyWith(
        password: password.valid ? password : Password.dirty(event.password),
        status: Formz.validate([password, state.username])));
  }

  Future<void> _loggedIn(LoggedIn event, dynamic emit) async {}

  Future<void> _registration<AuthenticationEvent>(
      RegistrationState event, dynamic emit) async {
    //emit(const AuthenticationState.loggingOut());
  }

  Future<void> _loggedOut<AuthenticationEvent>(
      LoggedOut event, dynamic emit) async {
    //emit(const AuthenticationState.loggingOut());
  }
}
