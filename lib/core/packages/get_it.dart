import 'package:bot_2000/fake_db/fake_db.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => FakeDB());
}
