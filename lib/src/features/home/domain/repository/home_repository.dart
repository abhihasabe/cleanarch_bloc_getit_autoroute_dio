import 'package:bloc_clean/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepository {
  Future<Either<Failure, dynamic>> getUser();
}
