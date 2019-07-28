import 'package:redux_learning/redux/actions/counter_actions.dart';
import 'package:redux_learning/redux/stores/counter_state.dart';

CounterState counterStateReducer(CounterState prevState, dynamic action) {
  if (action is IncrementAction) {
    return action.increment(prevState, action.amount);
  }
  return prevState;
}
