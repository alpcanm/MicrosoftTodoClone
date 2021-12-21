import 'package:bot_2000/core/bridge.dart';
import 'package:bot_2000/core/services/notes_services.dart';
import 'package:bot_2000/core/services/user_services.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => Bridge());
  getIt.registerLazySingleton(() => UserServices());
  getIt.registerLazySingleton(() => NoteServices());
}
