import 'package:bloc/bloc.dart';

import '../CounterEvent.dart';

class CounterFlutterBloc extends Bloc<CounterEvent, int>{
  CounterFlutterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case CounterEvent.Increment:
        yield state + 1;
        break;
      case CounterEvent.Decrement:
        yield state-1;
        break;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
  }
}