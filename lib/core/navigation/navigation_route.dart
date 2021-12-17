import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/pages/home.dart';
import 'package:bot_2000/view/pages/login.dart';
import 'package:bot_2000/view/pages/not_found.dart';
import 'package:bot_2000/view/pages/profile.dart';
import 'package:bot_2000/view/pages/register.dart';
import 'package:bot_2000/core/navigation/navigation_const.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.register:
        return normalNavigate(const RegisterPage(), url: args.name);
      case NavigationConstants.profile:
        return normalNavigate(const ProfilePage(), url: args.name);
      case NavigationConstants.login:
        return normalNavigate(const LoginPage(), url: args.name);
      case NavigationConstants.home:
        return normalNavigate(const HomePage(), url: args.name);
    }

    return MaterialPageRoute(
      builder: (context) => const NotFoundPage(),
    );
  }

  MaterialPageRoute normalNavigate(Widget widget, {String? url}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: url),
      builder: (context) => widget,
    );
  }
}
