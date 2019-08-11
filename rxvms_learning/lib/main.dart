import 'package:flutter/material.dart';
import 'package:rxvms_learning/pages/cat_facts_page.dart';
import 'package:rxvms_learning/pages/counter_page.dart';
import 'package:rxvms_learning/service_locator.dart';

void main() {
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatFactsPage(),
    );
  }
}
