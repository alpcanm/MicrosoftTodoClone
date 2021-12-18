import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/guard.dart';
import 'package:bot_2000/core/auto_route/route_const.dart';
import 'package:bot_2000/view/pages/home.dart';
import 'package:bot_2000/view/pages/login.dart';
import 'package:bot_2000/view/pages/not_found.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(page: HomePage, path: RouteConsts.HOME_PAGE, guards: [AuthGuard]),
    AutoRoute(page: NotFoundPage, path: RouteConsts.NOT_FOUN_PAGE),
  ],
)
class $AppRouter {}
