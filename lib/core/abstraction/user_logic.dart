import 'package:bot_2000/core/models/user.dart';

abstract class UserLogic {
  Future<User?> getCurrentUser();
}
