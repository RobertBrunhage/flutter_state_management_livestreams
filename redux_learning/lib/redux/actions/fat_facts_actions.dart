import 'dart:convert';

import 'package:redux_learning/models/cat_fact.dart';
import 'package:redux_learning/redux/stores/cats_facts_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:http/http.dart' as http;

class FetchCatFactsAction {
  ThunkAction<CatFactsState> fetchCats() {
    const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
    return (store) async {
      store.dispatch(FetchCatFactsLoadingAction);
      final response = await http.get(_catFactsUrl);

      // status code 200 means that we made a successful get
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedItems = json.decode(response.body);
        final catFacts = List.from(decodedItems['all']).map((json) => CatFact.fromJson(json)).toList();
        store.dispatch(FetchCatFactsSuccessAction(catFacts));
      } else {
        print('failed getting the data');
        store.dispatch(FetchCatFactsFailedAction);
      }
    };
  }
}

class FetchCatFactsLoadingAction {}

class FetchCatFactsFailedAction {}

class FetchCatFactsSuccessAction {
  List<CatFact> catFacts;

  FetchCatFactsSuccessAction(this.catFacts);
}

class IncrementFactsReadAction {}
