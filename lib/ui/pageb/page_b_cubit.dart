
import 'package:bloc/bloc.dart';
import 'package:demo1/io/local/DatabaseHelper.dart';
import 'package:demo1/io/local/TVSeries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

part 'page_b_state.dart';
part 'page_b_cubit.freezed.dart';

class PageBCubit extends Cubit<PageBState>{

  late DatabaseHelper databaseHelper;

  PageBCubit({required DatabaseHelper? databaseHelper}) : super(PageBState.initial()){
    this.databaseHelper = databaseHelper ?? GetIt.I<DatabaseHelper>();
  }

  final dbHelper = GetIt.I<DatabaseHelper>();
  final logger = Logger();

  void increment(){
    emit(PageBState.success(state.value + 1));
  }

  void undo(){
    emit(PageBState.success(state.value - 1));
  }

  void insertIntoDB() async{
    final tvSeriesMap = {'id': 1, 'title': "test", 'episodes': 2, 'image': '', 'description' : 'nothing' };
    final result = await dbHelper.addTVSeries(TVSeries.fromDbMap(tvSeriesMap));
    logger.d("Film hinzugefügt mit id: $result");
  }

  void getFromDB() async{
    final result = await dbHelper.fetchAllTvSeries();
    logger.d("Alle Results werden geholt");
    result!.forEach((element) {
      logger.d("Film mit der ID: ${element.id} heißt ${element.title}");
    });
  }
}