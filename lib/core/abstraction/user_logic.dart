import 'package:bot_2000/core/models/user.dart';

abstract class UserLogic {
  Future<User?> getCurrentUser();
  Future<User?> logIn({required String mail, required String password});
  Future logOut();
  Future<bool> registerUser(
      {required String name,
      required String surname,
      required String mail,
      required String password,
      String? phoneNumber});
}
