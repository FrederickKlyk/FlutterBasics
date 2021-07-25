import 'package:demo1/io/local/DatabaseHelper.dart';
import 'package:demo1/ui/pageb/page_b_cubit.dart';
import 'package:get_it/get_it.dart';

class GetItInitializer {
  final GetIt sl = GetIt.instance;

  void setup() {
    sl.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);

    sl.registerFactory(() =>
        PageBCubit(databaseHelper: sl.get<DatabaseHelper>()));
  }
}
