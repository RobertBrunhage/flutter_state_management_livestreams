import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/events/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield currentState + event.number;
    }
  }

  void increment(int number) {
    this.dispatch(IncrementEvent(number));
  }
}
