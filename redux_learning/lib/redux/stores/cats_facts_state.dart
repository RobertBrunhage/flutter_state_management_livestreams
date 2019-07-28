import 'package:redux_learning/models/cat_fact.dart';

enum LoadingState { none, loading, error }

class CatFactsState {
  List<CatFact> catFacts = [];
  int get facts => catFacts.length;

  LoadingState state = LoadingState.loading;

  int factsReadCount = 0;
  String get factsRead => factsReadCount.toString();
}
