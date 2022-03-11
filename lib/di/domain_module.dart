


import 'package:get_it/get_it.dart';

import '../domain/personen_interactor.dart';
import '../domain/personen_interactor_impl.dart';
import '../io/local/floor/PersonDao.dart';

void registerDomainModule() {
  final GetIt sl = GetIt.instance;

  sl.registerSingleton<PersonenInteractor>(
      PersonenInteractorImpl(sl.get<PersonDao>()));
}