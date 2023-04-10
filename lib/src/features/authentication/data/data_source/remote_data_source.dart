import 'package:bloc_clean/core/manager/dio_client_manager.dart';
import 'package:bloc_clean/core/errors/http/http_error.dart';
import 'package:bloc_clean/core/errors/domain_error.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/either.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, dynamic>> login(
      Uri uri, Map<String, dynamic> inputData);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> login(
      Uri url, Map<String, dynamic> inputData) async {
    try {
      final loginResp = await locator.get<DioClientManager>().request(
          url: url.toString(), method: RequestMethod.post, body: inputData);
      if (loginResp != null) {
        return Right(loginResp);
      } else {
        return Left(ServerFailure(message: 'Data Not Found'));
      }
    } on HttpError catch (e) {
      return Left(ServerFailure(message: e.message));
    } on DomainError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
