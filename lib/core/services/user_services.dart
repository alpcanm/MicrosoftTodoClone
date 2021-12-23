import 'dart:async';
import 'dart:convert';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/network/config.dart';
import 'package:bot_2000/core/repository/cache_manager.dart';
import 'package:dio/dio.dart';

class UserServices implements UserLogic {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  String? _token;

  String? errorMessage;
  late final CacheManager tokenCache;
  UserServices() {
    _baseOptions.baseUrl = NetworkConfig.baseUrl;
    _dio.options = _baseOptions;
    tokenCache = TokenCachManager(Keys.token);
    initFunction();
  }

  Future<void> initFunction() async {
    await tokenCache.init();
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      String? _token = tokenCache.getValues(Keys.token)?.first;
      if (_token != null) {
        _dio.options.headers['authorization'] = 'Bearer $_token';
        Response _response = await _dio.get('/protected');
        User _user = User.fromMap(_response.data);
        return _user;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future logOut() async {
    await tokenCache.clearBox();
    return null;
  }

  @override
  Future<User?> logIn({required String mail, required String password}) async {
    await Future.delayed(Duration.zero);
    Map _map = {'mail': mail, 'password': password};
    try {
      Response _response = await _dio.post('login', data: json.encode(_map));
      _token = _response.data['access_token'];
      if (_token != null) {
        await tokenCache.clearBox();
        await tokenCache.addToBox(_token!);
      }
      _dio.options.headers['authorization'] = 'Bearer $_token';
      _response = await _dio.get('/protected');
      User _user = User.fromMap(_response.data);
      return _user;
    } catch (e) {
      print(e);
      return null;
    }
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
