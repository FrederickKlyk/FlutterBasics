import 'package:get_it/get_it.dart';

import '../domain/personen_interactor.dart';
import '../io/local/DatabaseHelper.dart';
import '../ui/pageb/page_b_cubit.dart';

void registerUiModule() {
  final GetIt sl = GetIt.instance;

  sl.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);

  sl.registerSingleton<PageBCubit>(PageBCubit(
      databaseHelper: sl.get<DatabaseHelper>(),
      personenInteractor: sl.get<PersonenInteractor>()));
}