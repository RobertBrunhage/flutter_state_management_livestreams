import 'package:redux_learning/redux/stores/counter_state.dart';

class IncrementAction {
  int amount;
  IncrementAction(this.amount);

  CounterState increment(CounterState prevState, int amount) {
    prevState.count += amount;
    return prevState;
  }
}
