import 'package:bot_2000/core/auto_route/auto_route.gr.dart';
import 'package:bot_2000/core/auto_route/guard.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  setupGetIt();
  await Hive.initFlutter();

  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => ViewModel()),
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _viewModel.themeData,
    );
  }
}
