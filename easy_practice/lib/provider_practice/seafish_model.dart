import 'package:flutter/material.dart';

class SeafishModel with ChangeNotifier {
  final String name;
  int tunaNumber;
  final String size;

  SeafishModel(
      {required this.name, required this.tunaNumber, required this.size});

  void changeFishNumber() {
    tunaNumber++;
    notifyListeners();
  }
}
