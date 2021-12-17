import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/view/pages/home.dart';
import 'package:bot_2000/view/pages/login.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true, path: 'login'),
    AutoRoute(page: HomePage, path: 'home-page'),
  ],
)
class $AppRouter {}
