


import 'package:get_it/get_it.dart';

import '../io/local/floor/AppDatabase.dart';



Future registerDatabaseModule() async {
  final GetIt sl = GetIt.instance;

  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerLazySingleton(() => database.personDao);
}