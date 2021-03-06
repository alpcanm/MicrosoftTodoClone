import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/guardian/guard.dart';
import 'package:bot_2000/core/auto_route/route_const.dart';
import 'package:bot_2000/view/pages/home.dart';
import 'package:bot_2000/view/pages/login.dart';
import 'package:bot_2000/view/pages/not_found.dart';
import 'package:bot_2000/view/pages/register.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(page: HomePage, path: RouteConsts.HOME_PAGE, guards: [AuthGuard]),
    AutoRoute(page: NotFoundPage, path: RouteConsts.NOT_FOUN_PAGE),
    AutoRoute(page: RegisterPage, path: RouteConsts.REGISTER_PAGE),
  ],
)
class $AppRouter {}
