import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  get removeAllOldRoutes => (Route<dynamic> route) => false;

  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  Future<void> navigateToPageClear({required String path}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes);
  }

  Future<void> navigateToReplacement({required String path}) async {
    await navigatorKey.currentState!.pushReplacementNamed(path);
  }
}
