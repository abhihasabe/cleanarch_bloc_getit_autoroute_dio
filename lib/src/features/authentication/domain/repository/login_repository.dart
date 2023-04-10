import 'package:bloc_clean/src/features/authentication/data/model/login_model.dart';
import 'package:bloc_clean/src/features/authentication/domain/usecase/login_usecase.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class LoginRepository {
  Future<Either<Failure, dynamic>> userLogin(User loginData);
}