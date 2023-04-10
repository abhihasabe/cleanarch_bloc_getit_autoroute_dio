import 'package:bloc_clean/src/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bloc_clean/src/features/home/domain/repository/home_repository.dart';
import 'package:bloc_clean/core/constants/app_network_constants.dart';
import 'package:bloc_clean/core/errors/http/http_error.dart';
import 'package:bloc_clean/core/errors/domain_error.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/src/either.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<Failure, dynamic>> getUser() async {
    try {
      final uri = Uri.parse(AppNetworkConstants.listURL);
      return locator.get<HomeRemoteDataSource>().getUsers(uri);
    } on HttpError catch (e) {
      return Left(ServerFailure(message: e.message));
    } on DomainError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
