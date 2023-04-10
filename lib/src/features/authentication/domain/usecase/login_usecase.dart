import 'package:bloc_clean/src/features/authentication/data/data_source/remote_data_source.dart';
import 'package:bloc_clean/src/features/authentication/data/model/login_model.dart';
import 'package:bloc_clean/src/features/authentication/domain/repository/login_repository.dart';
import 'package:bloc_clean/core/usecase/usecase.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/src/either.dart';

class LoginUseCase implements UseCaseOneInput<User, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(User loginData) async {
    return await locator.get<LoginRepository>().userLogin(loginData);
  }
}

class User {
  String email;
  String password;

  User({required this.email, required this.password});
}
