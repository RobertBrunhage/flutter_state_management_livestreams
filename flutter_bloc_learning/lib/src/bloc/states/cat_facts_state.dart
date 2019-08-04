import 'package:flutter_bloc_learning/src/models/cat_fact.dart';

enum LoadingState { none, loading, error }

class CatFactsState {
  List<CatFact> catFacts = [];
  int get facts => catFacts.length;

  LoadingState state = LoadingState.loading;

  int factsReadCount = 0;
  String get factsRead => factsReadCount.toString();

  CatFactsState.initial();
  CatFactsState(CatFactsState currentState) {
    this.catFacts = currentState.catFacts;
    this.state = currentState.state;
    this.factsReadCount = currentState.factsReadCount;
  }

  @override
  String toString() {
    return 'total facts: $facts';
  }
}
