import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';

class UserServices implements UserLogic {
  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future logOut() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return null;
  }
}
