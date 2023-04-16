import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter = 0;
  void increment() {
    _counter++;
    notifyListeners();
  }

  int get getCounter => _counter;
  set setCounter(int num) {
    _counter = num;
    notifyListeners();
  }
}
