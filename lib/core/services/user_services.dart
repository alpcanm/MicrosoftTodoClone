import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:flutter/services.dart';

class UserServices implements UserLogic {
  bool _isActive = false;

  UserServices() {
    print("isActive " + _isActive.toString());
  }
  @override
  Future<User?> getCurrentUser() async {
    await Future.delayed(Duration.zero);
    User? _user;
    if (_isActive) {
      final String response = await rootBundle.loadString('fake_db/user.json');
      _user = User.fromJson(response);
      return _user;
    } else {
      return null;
    }
  }

  @override
  Future logOut() async {
    await Future.delayed(const Duration(milliseconds: 150));
    _isActive = false;
    return null;
  }

  @override
  Future<bool> logIn({required String mail, required String password}) async {
    await Future.delayed(Duration.zero);

    if (mail == "alpcan") {
      _isActive = true;
      print(_isActive);
      return true;
    } else {
      _isActive = false;
      return false;
    }
  }
}
