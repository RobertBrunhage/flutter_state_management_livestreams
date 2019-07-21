import 'package:flutter/material.dart';
import 'package:provider_learning/src/models/counter.dart';

class CounterStore with ChangeNotifier {
  Counter _counter = Counter();

  int get count => _counter.count;

  void increment() {
    _counter.increment();
    notifyListeners();
  }
}
