import 'package:bloc_clean/src/features/home/domain/repository/home_repository.dart';
import 'package:bloc_clean/core/usecase/usecase.dart';
import 'package:bloc_clean/core/errors/failure.dart';
import 'package:bloc_clean/di/injection.dart';
import 'package:either_dart/src/either.dart';

class HomeUseCase implements UseCaseNoInput<dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await locator.get<HomeRepository>().getUser();
  }
}
