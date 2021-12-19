import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/network/config.dart';
import 'package:dio/dio.dart';

class UserServices implements UserLogic {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  UserServices() {
    _baseOptions.baseUrl = NetworkConfig.baseUrl;
    _dio.options = _baseOptions;
  }
  @override
  Future<User?> getCurrentUser() async {}

  @override
  Future logOut() async {
    await Future.delayed(const Duration(milliseconds: 150));

    return null;
  }

  @override
  Future<bool> logIn({required String mail, required String password}) async {
    await Future.delayed(Duration.zero);
    return false;
  }

  @override
  Future<bool> registerUser(
      {required String name,
      required String surname,
      required String mail,
      required String password,
      String? phoneNumber}) async {
    final DateTime _now = DateTime.now();
    User _user = User(
      phoneNumber: phoneNumber ?? '',
      photoURL: '',
      userId: '',
      surname: surname,
      creatadAt: _now,
      mail: mail,
      mailVerified: false,
      name: name,
      password: password,
    );

    try {
      await _dio.post('/users', data: _user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
