import 'package:bot_2000/core/auto_route/auto_route.gr.dart';
import 'package:bot_2000/core/auto_route/guardian/guard.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/core/view_model/window_state.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  setupGetIt();
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => ViewModel()),
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
      ChangeNotifierProvider(create: (context) => WindowState()),
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
      title: 'Microsoft To Do Clone App',
      theme: _viewModel.themeData,
    );
  }
}
