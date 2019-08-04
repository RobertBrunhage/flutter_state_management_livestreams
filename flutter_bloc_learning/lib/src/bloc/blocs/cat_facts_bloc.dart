import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_learning/src/bloc/events/cat_facts_events.dart';
import 'package:flutter_bloc_learning/src/bloc/states/cat_facts_state.dart';

class CatFactsBloc extends Bloc<CatFactsEvent, CatFactsState> {
  @override
  CatFactsState get initialState => CatFactsState.initial();

  @override
  Stream<CatFactsState> mapEventToState(CatFactsEvent event) async* {
    final newState = CatFactsState(currentState);
    if (event is FetchCatFactsLoading) {
      newState.state = LoadingState.loading;
      yield newState;
    }
    if (event is FetchCatFactsFailed) {
      newState.state = LoadingState.error;
      yield newState;
    }
    if (event is FetchCatFactsSuccess) {
      newState.state = LoadingState.none;
      newState.catFacts = event.catFacts;
      yield newState;
    }
    if (event is IncrementFactsRead) {
      newState.factsReadCount++;
      yield newState;
    }
  }

  @override
  void onTransition(Transition transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
  }
}
