import 'dart:convert';

import 'package:rxvms_learning/models/cat_fact.dart';
import 'package:http/http.dart' as http;

abstract class CatFactService {
  Future<List<CatFact>> fetchCatFacts();
}

class CatFactServiceImplementation implements CatFactService {
  static const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';

  @override
  Future<List<CatFact>> fetchCatFacts() async {
    final response = await http.get(_catFactsUrl);

    // status code 200 means that we made a successful get
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedItems = json.decode(response.body);
      var catFacts = List.from(decodedItems['all']).map((json) => CatFact.fromJson(json)).toList();
      return catFacts;
    } else {
      throw Exception('Cat API Error');
    }
  }
}
