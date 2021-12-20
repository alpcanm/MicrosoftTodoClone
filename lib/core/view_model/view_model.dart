import 'dart:async';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/bridge.dart';
import 'package:bot_2000/view/theme/theme.dart';
import 'package:flutter/material.dart';

enum ThemeState { dark, light }

class ViewModel with ChangeNotifier implements UserLogic {
  final Bridge _repository = getIt<Bridge>();
  ViewModel() {
    getCurrentUser();
  }
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  ThemeData _themeData = ToDoTheme.light();
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void _setTheme(ThemeState themeState) {
    if (themeState == ThemeState.light) {
      themeData = ToDoTheme.light();
    } else {
      themeData = ToDoTheme.dark();
    }
  }

  ThemeState _themeState = ThemeState.light;
  ThemeState get themeState => _themeState;
  set themeState(ThemeState themeState) {
    _themeState = themeState;
    _setTheme(_themeState);
    notifyListeners();
  }

  String _noteBookId = '';
  String get noteBookId => _noteBookId;
  set noteBookId(String noteBookId) {
    _noteBookId = noteBookId;
    notifyListeners();
  }

  String _noteBookText = '';
  String get noteBookText => _noteBookText;
  set noteBookText(String noteBookText) {
    _noteBookText = noteBookText;
    notifyListeners();
  }

  @override
  Future<User?> getCurrentUser() async {
    user = await _repository.getCurrentUser();
    return user;
  }

  @override
  Future logOut() async {
    user = await _repository.logOut();
    return user;
  }

  @override
  Future<User?> logIn({required String mail, required String password}) {
    return _repository.logIn(mail: mail, password: password);
  }

  @override
  Future<bool> registerUser(
      {required String name,
      required String surname,
      required String mail,
      required String password,
      String? phoneNumber}) {
    return _repository.registerUser(
        mail: mail,
        password: password,
        name: name,
        surname: surname,
        phoneNumber: phoneNumber);
  }
}
