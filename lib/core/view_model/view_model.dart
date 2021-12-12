import 'dart:async';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/repository.dart';
import 'package:flutter/cupertino.dart';

class ViewModel with ChangeNotifier implements UserLogic {
  final Repository _repository = getIt<Repository>();
  ViewModel() {
    getCurrentUser();
  }
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  String _noteBookId = '';
  String get noteBookId => _noteBookId;
  set noteBookId(String noteBookId) {
    _noteBookId = noteBookId;
    notifyListeners();
  }


  @override
  Future<User?> getCurrentUser() async {
    user = await _repository.getCurrentUser();
    return user;
  }
}
