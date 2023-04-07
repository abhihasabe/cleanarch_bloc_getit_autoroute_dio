import 'package:bloc_clean/core/manager/cache_manager.dart';
import 'package:bloc_clean/core/manager/dio_client_manager.dart';
import 'package:bloc_clean/core/manager/network_info_manager.dart';
import 'package:bloc_clean/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<void> initManagers() async {}

Future<void> initBlocs() async {
  locator.registerLazySingleton(() => AuthenticationBloc());
}

Future<void> initUseCases() async {}

Future<void> initRepositories() async {}

Future<void> initDataSources() async {
  await locator.get<Future<SharedPreferences>>().then((sharedPrefsValue) {
    locator.registerLazySingleton<CacheManager>(
        () => CacheManagerImpl(initSharedPref: sharedPrefsValue));
  });
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: locator()));
  locator.registerLazySingleton<DioClient>(
      () => DioClientManager(client: locator()));
}
