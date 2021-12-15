import 'package:bot_2000/core/extra_methods/extra_methods.dart';
import 'package:bot_2000/core/repository.dart';
import 'package:bot_2000/core/services/notes_services.dart';
import 'package:bot_2000/core/services/user_services.dart';
import 'package:bot_2000/fake_db/fake_api.dart';
import 'package:bot_2000/fake_db/fake_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => FakeApi());
  getIt.registerLazySingleton(() => FakeService());
  getIt.registerLazySingleton(() => Repository());
  getIt.registerLazySingleton(() => UserServices());
  getIt.registerLazySingleton(() => NoteServices());
  getIt.registerLazySingleton(() => ExtraMethods());
}
