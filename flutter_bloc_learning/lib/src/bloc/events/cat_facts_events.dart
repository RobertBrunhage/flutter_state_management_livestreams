import 'dart:convert';

import 'package:flutter_bloc_learning/src/bloc/blocs/cat_facts_bloc.dart';
import 'package:flutter_bloc_learning/src/models/cat_fact.dart';

import 'package:http/http.dart' as http;

abstract class CatFactsEvent {}

class FetchCatFacts extends CatFactsEvent {
  FetchCatFacts(CatFactsBloc bloc) {
    fetch(bloc);
  }

  void fetch(CatFactsBloc bloc) async {
    const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
    bloc.dispatch(FetchCatFactsLoading());
    final response = await http.get(_catFactsUrl);

    // status code 200 means that we made a successful get
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedItems = json.decode(response.body);
      final catFacts = List.from(decodedItems['all']).map((json) => CatFact.fromJson(json)).toList();
      bloc.dispatch(FetchCatFactsSuccess(catFacts));
    } else {
      print('failed getting data');
      bloc.dispatch(FetchCatFactsFailed());
    }
  }
}

class FetchCatFactsLoading extends CatFactsEvent {
  @override
  String toString() {
    return 'FetchCatFactsLoading';
  }
}

class FetchCatFactsFailed extends CatFactsEvent {
  @override
  String toString() {
    return 'FetchCatFactsFailed';
  }
}

class FetchCatFactsSuccess extends CatFactsEvent {
  List<CatFact> catFacts;

  FetchCatFactsSuccess(this.catFacts);

  @override
  String toString() {
    return 'FetchCatFactsSuccess';
  }
}

class IncrementFactsRead extends CatFactsEvent {
  @override
  String toString() {
    return 'IncrementFactsRead';
  }
}
