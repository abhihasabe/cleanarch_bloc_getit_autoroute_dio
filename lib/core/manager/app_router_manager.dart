import 'package:auto_route/auto_route.dart';
import 'app_router_manager.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: Splash.page),
    AutoRoute(path: '/login', page: Login.page),
    AutoRoute(path: '/registration', page: Registration.page),
    AutoRoute(path: '/home', page: Home.page),
    AutoRoute(path: '/setting', page: Setting.page)
  ];
}