import 'package:demo1/io/local/DatabaseHelper.dart';
import 'package:demo1/ui/pageb/PageBCubit.dart';
import 'package:get_it/get_it.dart';

class GetItInitializer {
  final GetIt sl = GetIt.instance;

  void setup() {
    sl.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);

    sl.registerSingleton<PageBCubit>(
        PageBCubit(databaseHelper: sl.get<DatabaseHelper>()));
  }
}
