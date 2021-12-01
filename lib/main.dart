import 'package:bot_2000/core/navigation/navigation_route.dart';
import 'package:bot_2000/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
