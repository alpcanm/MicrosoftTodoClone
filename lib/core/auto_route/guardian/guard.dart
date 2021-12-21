import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/auto_route.gr.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/services/user_services.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final UserServices _userServices = getIt<UserServices>();
    await _userServices.initFunction();
    bool? _result = _userServices.tokenCache.isNotEmpty(Keys.token);
    if (_result != null && _result) {
      resolver.next(true);
    } else {
      router.push(const NotFoundRoute());
    }
  }
}
