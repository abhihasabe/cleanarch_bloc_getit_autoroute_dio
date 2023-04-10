import 'package:bloc_clean/src/features/authentication/data/repository/login_repository_impl.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bloc_clean/src/features/authentication/data/data_source/remote_data_source.dart';
import 'package:bloc_clean/src/features/authentication/domain/repository/login_repository.dart';
import 'package:bloc_clean/src/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bloc_clean/src/features/authentication/domain/usecase/login_usecase.dart';
import 'package:bloc_clean/src/features/home/data/repository/home_repository_impl.dart';
import 'package:bloc_clean/src/features/home/domain/repository/home_repository.dart';
import 'package:bloc_clean/src/features/home/domain/usecase/home_usecase.dart';
import 'package:bloc_clean/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:bloc_clean/core/manager/network_info_manager.dart';
import 'package:bloc_clean/core/manager/dio_client_manager.dart';
import 'package:bloc_clean/core/manager/cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await initGlobals();
  await initManagers();
  await initBlocs();
  await initUseCases();
  await initRepositories();
  await initDataSources();
}

Future<void> initGlobals() async {
  locator.registerLazySingleton<Future<SharedPreferences>>(
      () => SharedPreferences.getInstance());
  locator.registerLazySingleton(() => Dio());
}

Future<void> initManagers() async {
  await locator.get<Future<SharedPreferences>>().then((sharedPrefsValue) {
    locator.registerLazySingleton<CacheManager>(
        () => CacheManagerImpl(initSharedPref: sharedPrefsValue));
  });
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: locator()));
  locator.registerLazySingleton<DioClientManager>(
      () => DioClientManagerImpl(client: locator()));
}

Future<void> initBlocs() async {
  locator.registerLazySingleton(() => AuthenticationBloc());
  locator.registerLazySingleton(() => HomeBloc());
}

Future<void> initUseCases() async {
  locator.registerLazySingleton(() => LoginUseCase());
  locator.registerLazySingleton(() => HomeUseCase());
}

Future<void> initRepositories() async {
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
}

Future<void> initDataSources() async {
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());
  locator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());
}
