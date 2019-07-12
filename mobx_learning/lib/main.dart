import 'package:flutter/material.dart';
import 'package:mobx_learning/src/mobx/cats_store/cats_store.dart';
import 'package:mobx_learning/src/pages/cat_facts_page.dart';
import 'package:mobx_learning/src/pages/counter_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CatsStore>(
      builder: (_) => CatsStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatFactsPage(),
      ),
    );
  }
}
