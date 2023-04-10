import 'package:bloc_clean/core/validations/confirm_password_validation.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:bloc_clean/src/features/authentication/domain/usecase/login_usecase.dart';
import 'package:bloc_clean/src/features/authentication/data/model/login_model.dart';
import 'package:bloc_clean/core/validations/number_validation_dart.dart';
import 'package:bloc_clean/core/validations/password_validation.dart';
import 'package:bloc_clean/core/validations/email_validation.dart';
import 'package:bloc_clean/core/validations/name_validation.dart';
import 'package:bloc_clean/core/errors/http/http_error.dart';
import 'package:bloc_clean/core/errors/domain_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:formz/formz.dart';
import 'dart:async';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<UsernameChanged>(_nameChanged);
    on<EmailChanged>(_emailChanged);
    on<PhoneNoChanged>(_phoneNoChanged);
    on<PasswordChanged>(_passwordChanged);
    on<ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<LoggedIn>(_loggedIn);
    on<RegistrationState>(_registration);
    on<LoggedOut>(_loggedOut);
  }

  var password;

  _nameChanged<AuthenticationEvent>(
      UsernameChanged event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState()
        .copyWith(username: Name.dirty(event.username)));
  }

  _emailChanged<AuthenticationEvent>(
      EmailChanged event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState().copyWith(email: Email.dirty(event.email)));
  }

  _phoneNoChanged<AuthenticationEvent>(
      PhoneNoChanged event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState()
        .copyWith(phoneNo: Number.dirty(event.phoneNo)));
  }

  _passwordChanged<AuthenticationEvent>(
      PasswordChanged event, Emitter<AuthenticationState> emit) {
    password = event.password;
    emit(const AuthenticationState()
        .copyWith(password: Password.dirty(event.password)));
  }

  _confirmPasswordChanged<AuthenticationEvent>(
      ConfirmPasswordChanged event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState().copyWith(
        confirmPassword: ConfirmPassword.dirty(
            password: password, value: event.confirmPassword)));
  }

  void _loggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await locator
        .get<LoginUseCase>()
        .invoke(User(email: event.email, password: event.password))
        .then((value) async {
      try {
        await value.fold((left) async {
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure, outPut: left.props.first));
        }, (right) async {
          emit(state.copyWith(
              status: FormzSubmissionStatus.success,
              outPut: LoginModel.fromJson(right)));
        });
      } on HttpError catch (e) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, outPut: e.message));
      } on DomainError catch (e) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, outPut: e.message));
      }
    });
  }

  Future<void> _registration<AuthenticationEvent>(
      RegistrationState event, dynamic emit) async {
    //emit(const AuthenticationState.loggingOut());
  }

  Future<void> _loggedOut<AuthenticationEvent>(
      LoggedOut event, dynamic emit) async {
    //emit(const AuthenticationState.loggingOut());
  }
}
