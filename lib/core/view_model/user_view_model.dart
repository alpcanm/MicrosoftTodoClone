import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_db.dart';
import 'package:flutter/cupertino.dart';

class UserVM with ChangeNotifier {
  final FakeDB _fakeDB = getIt<FakeDB>();
  UserVM() {
    currentUser();
  }
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  currentUser() {
    user = _fakeDB.user;
  }
}
