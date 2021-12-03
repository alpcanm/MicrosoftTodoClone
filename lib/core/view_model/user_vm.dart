import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/repository.dart';
import 'package:flutter/cupertino.dart';

class UserVM with ChangeNotifier implements UserLogic {
  final Repository _repository = getIt<Repository>();

  UserVM() {
    getCurrentUser();
  }
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  @override
  Future<User?> getCurrentUser() async {
    user = await _repository.getCurrentUser();
  }
}
