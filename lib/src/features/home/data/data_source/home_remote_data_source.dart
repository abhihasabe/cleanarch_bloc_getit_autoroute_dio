import 'package:bloc_clean/core/manager/dio_client_manager.dart';
import 'package:bloc_clean/core/errors/http/http_error.dart';
import 'package:bloc_clean/core/errors/domain_error.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/either.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, dynamic>> getUsers(Uri uri);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getUsers(Uri url) async {
    try {
      final loginResp = await locator
          .get<DioClientManager>()
          .request(url: url.toString(), method: RequestMethod.get);
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
