import 'dart:convert';
import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/network/config.dart';
import 'package:dio/dio.dart';

class ExtraMethods {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  ExtraMethods() {
    _baseOptions.baseUrl = NetworkConfig.baseUrl;
    _dio.options = _baseOptions;
  }

  Future<bool> lastUpdateNote(String relationId) async {
    final String _now = DateTime.now().toString();
    Map _data = {"last_update": _now};
    try {
      await _dio.patch('${Keys.tableNotes}/$relationId',
          data: jsonEncode(_data));
    } catch (e) {
      print(e);
    }
    return true;
  }
}
