import 'package:flutter/material.dart';

class BannerIndex with ChangeNotifier {
  int _currentPos;

  BannerIndex(this._currentPos);

  int get sana => _currentPos;

  set sana(int value) {
    _currentPos = value;
  }

  check(int index) {
    sana = index;
    notifyListeners();
  }
}
