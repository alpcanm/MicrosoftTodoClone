import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheManager {
  Box<String>? _box;
  final String key;
  CacheManager(this.key);
  Future<void> init() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<String>(key);
    }
  }

  Iterable<String>? getValues(String key);
  Future<void> addToBox(String value);
  Future<void> putToBox(String key, String value);
  bool? isNotEmpty(String key);
  Future<void> clearBox() async {
    await _box?.clear();
  }
}

class TokenCachManager extends CacheManager {
  TokenCachManager(String key) : super(key);

  @override
  Future<void> addToBox(String value) async {
    await _box?.add(value);
  }

  @override
  Future<void> putToBox(String key, String value) async {
    await _box?.put(key, value);
  }

  @override
  Iterable<String>? getValues(String key) {
    return _box?.values;
  }

  @override
  bool? isNotEmpty(String key) {
    return _box?.isNotEmpty;
  }
}
