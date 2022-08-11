import 'package:flutter/material.dart';

class ProductIndex with ChangeNotifier {
  int _currentPos;

  ProductIndex(this._currentPos);

  int get sana => _currentPos;

  set sana(int value) {
    _currentPos = value;
  }

  check(int index) {
    sana = index;
    notifyListeners();
  }
}
