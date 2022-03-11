import 'package:bloc/bloc.dart';
import 'package:demo1/domain/personen_interactor.dart';
import 'package:demo1/io/local/DatabaseHelper.dart';
import 'package:demo1/io/local/TVSeries.dart';
import 'package:demo1/io/local/floor/Person.dart';
import 'package:demo1/io/local/floor/PersonDao.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

part 'page_b_cubit.freezed.dart';

part 'page_b_state.dart';

class PageBCubit extends Cubit<PageBState> {
  //SQFlite
  late DatabaseHelper databaseHelper;
  late PersonenInteractor personenInteractor;

  PageBCubit({required DatabaseHelper? databaseHelper, required PersonenInteractor personenInteractor})
      : super(PageBState.initial()) {
    this.databaseHelper = databaseHelper ?? GetIt.I<DatabaseHelper>();
    this.personenInteractor = personenInteractor;
  }

  final dbHelper = GetIt.I<DatabaseHelper>();
  final logger = Logger();

  //FLOOR
  // final dao =  $FloorAppDatabase.databaseBuilder('app_database.db').build().then((value) => value.personDao);

  void addUser() async {
    final person = Person(1, "Frank");
    personenInteractor.insertPerson(person);
    logger.d("Person wurde hinzugefügt namens: ${person.name}");
  }

  void getUserFromFloor() async {
    final result = personenInteractor.findPersonById(1);
    result.forEach((element) {
      logger.d("Person die gefunden wurde ist ${element?.name}");
    });
  }

  void increment() {
    emit(PageBState.success(state.value + 1));
  }

  void undo() {
    emit(PageBState.success(state.value - 1));
  }

  void insertIntoDB() async {
    final tvSeriesMap = {
      'id': 1,
      'title': "test",
      'episodes': 2,
      'image': '',
      'description': 'nothing'
    };
    final result = await dbHelper.addTVSeries(TVSeries.fromDbMap(tvSeriesMap));
    logger.d("Film hinzugefügt mit id: $result");
  }

  void getFromDB() async {
    final result = await dbHelper.fetchAllTvSeries();
    logger.d("Alle Results werden geholt");
    result!.forEach((element) {
      logger.d("Film mit der ID: ${element.id} heißt ${element.title}");
    });
  }
}
