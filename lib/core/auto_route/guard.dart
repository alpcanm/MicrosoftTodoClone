import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/auto_route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(resolver.route.args);
    if (true) {
      resolver.next(true);
    } else {
      router.push(const NotFoundRoute());
    }
  }
}
