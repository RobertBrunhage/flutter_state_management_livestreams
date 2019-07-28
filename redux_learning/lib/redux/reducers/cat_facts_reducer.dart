import 'package:redux_learning/redux/actions/fat_facts_actions.dart';
import 'package:redux_learning/redux/stores/cats_facts_state.dart';

CatFactsState catFactsReducer(CatFactsState prevState, dynamic action) {
  if (action == FetchCatFactsLoadingAction) {
    prevState.state = LoadingState.loading;
    return prevState;
  }
  if (action == FetchCatFactsFailedAction) {
    prevState.state = LoadingState.error;
    return prevState;
  }
  if (action is FetchCatFactsSuccessAction) {
    prevState.state = LoadingState.none;
    prevState.catFacts = action.catFacts;
    return prevState;
  }
  if (action == IncrementFactsReadAction) {
    prevState.factsReadCount++;
    return prevState;
  }

  return prevState;
}
