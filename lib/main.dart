import 'package:bot_2000/core/navigation/navigation_route.dart';
import 'package:bot_2000/core/navigation/navigation_service.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/view_model/note_book_vm.dart';
import 'package:bot_2000/core/view_model/user_vm.dart';
import 'package:bot_2000/view/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupGetIt();
  runApp(MultiProvider(
    child: const MyApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => UserVM()),
      ChangeNotifierProvider(create: (context) => NoteBookVM()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ToDoTheme.dark();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      theme: theme,
    );
  }
}
