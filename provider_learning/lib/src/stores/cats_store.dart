import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:provider_learning/src/models/cat_fact.dart';
import 'package:http/http.dart' as http;

enum LoadingState { none, loading, error }

class CatsStore with ChangeNotifier {
  static const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';

  CatsStore() {
    fetchCatsFacts();
  }

  List<CatFact> _catFacts = [];
  List<CatFact> get catFacts => _catFacts;
  int get facts => _catFacts.length;

  LoadingState _state = LoadingState.loading;
  LoadingState get state => _state;

  int _factsReadCount = 0;
  int get factsReadCount => _factsReadCount;
  String get factsRead => _factsReadCount.toString();

  void incrementFactsRead() {
    _factsReadCount++;
    notifyListeners();
  }

  _changeLoadingState(LoadingState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> fetchCatsFacts() async {
    _changeLoadingState(LoadingState.loading);
    final response = await http.get(_catFactsUrl);

    // status code 200 means that we made a successful get
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedItems = json.decode(response.body);
      _catFacts = List.from(decodedItems['all']).map((json) => CatFact.fromJson(json)).toList();
      _changeLoadingState(LoadingState.none);
    } else {
      print('failed getting the data');
      _changeLoadingState(LoadingState.error);
    }
  }
}
