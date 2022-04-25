import 'dart:async';
import 'dart:convert';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/config_const.dart';
import 'package:bot_2000/core/repository/cache_manager.dart';
import 'package:dio/dio.dart';

class UserServices implements UserLogic {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  String? _token;

  final String _clientKey = '08fbaf62e68543ab977dc6c3bc2a3208';
  String? errorMessage;
  late final CacheManager tokenCache;
  UserServices() {
    _baseOptions.baseUrl = NetworkConfig.authBaseUrl;
    _baseOptions.headers = {'X-Client-Key': _clientKey};
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
        Response _response = await _dio.get('/users/$_token');
        User _user = User.fromMap(_response.data);
        return _user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future logOut() async {
    await tokenCache.clearBox();
    return null;
  }

  @override
  Future<User?> logIn({required String mail, required String password}) async {
    await Future.delayed(Duration.zero);
    Map _map = {'email': mail, 'password': password};
    var _response;
    try {
      _response = await _dio.post(
        '/_api/rest/v1/auth/signin-email',
        data: json.encode(_map),
      );

      _token = _response.data['user']['_id'];
      if (_token != null) {
        await tokenCache.clearBox();
        await tokenCache.addToBox(_token!);
      }
      final _dbDio = Dio();
      final _dbDioOptions = BaseOptions(baseUrl: NetworkConfig.baseUrl);
      _dbDio.options = _dbDioOptions;
      Response _response2 = await _dbDio.get('/users/$_token');
      User _user = User.fromMap(_response2.data);
      return _user;
    } catch (e) {
      print(_token);
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
        userId: '',
        surname: surname,
        mail: mail,
        name: name,
        password: password);

    try {
      Response _response = await _dio.post('/_api/rest/v1/auth/signup-email',
          data: {'email': _user.mail, 'password': _user.password});
      if (_response.statusCode == 200) {
        print('db ye gönder');
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
