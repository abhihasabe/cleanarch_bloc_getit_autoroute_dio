import 'package:bloc_clean/src/features/authentication/data/model/login_model.dart';
import 'package:bloc_clean/src/features/authentication/data/data_source/remote_data_source.dart';
import 'package:bloc_clean/src/features/authentication/domain/repository/login_repository.dart';
import 'package:bloc_clean/src/features/authentication/domain/usecase/login_usecase.dart';
import 'package:bloc_clean/core/constants/app_network_constants.dart';
import 'package:bloc_clean/core/errors/http/http_error.dart';
import 'package:bloc_clean/core/errors/domain_error.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/src/either.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, dynamic>> userLogin(
      User loginData) async {
    try {
      final uri = Uri.parse(AppNetworkConstants.loginURL);
      Map<String, dynamic> loginJsonData = {
        "username": loginData.email,
        "password": loginData.password
      };
      return locator.get<LoginRemoteDataSource>().login(uri, loginJsonData);
    } on HttpError catch (e) {
      return Left(ServerFailure(message: e.message));
    } on DomainError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
