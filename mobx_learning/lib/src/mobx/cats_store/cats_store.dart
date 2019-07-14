import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:mobx_learning/src/models/cat_fact.dart';
import 'package:http/http.dart' as http;

part 'cats_store.g.dart';

enum LoadingState { none, loading, error }

class CatsStore = _CatsStore with _$CatsStore;

abstract class _CatsStore with Store {
  static const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';

  _CatsStore() {
    fetchCatsFacts();
  }

  @observable
  List<CatFact> catFacts = [];

  @observable
  LoadingState state = LoadingState.loading;

  @computed
  int get facts => catFacts.length;

  @observable
  int factsReadCount = 0;

  @computed
  String get factsRead => factsReadCount.toString();

  @action
  void incrementFactsRead() {
    factsReadCount++;
  }

  @action
  Future<void> fetchCatsFacts() async {
    state = LoadingState.loading;
    final response = await http.get(_catFactsUrl);

    // status code 200 means that we made a successful get
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedItems = json.decode(response.body);
      catFacts = List.from(decodedItems['all']).map((json) => CatFact.fromJson(json)).toList();
      state = LoadingState.none;
    } else {
      print('failed getting the data');
      state = LoadingState.error;
    }
  }
}
