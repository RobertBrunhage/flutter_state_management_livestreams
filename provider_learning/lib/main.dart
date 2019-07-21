import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/src/pages/cat_facts_page.dart';
//import 'package:provider_learning/src/pages/counter_page.dart';
import 'package:provider_learning/src/stores/cats_store.dart';
import 'package:provider_learning/src/stores/counter_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => CounterStore(),
        ),
        ChangeNotifierProvider(
          builder: (_) => CatsStore(),
        ),
      ],
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
