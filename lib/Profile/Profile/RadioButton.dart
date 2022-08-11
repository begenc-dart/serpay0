import 'package:flutter/material.dart';
class RadioButton with ChangeNotifier{
  String _currentPos ;

  RadioButton(this._currentPos);
  String get sana => _currentPos;
  set sana(String value) {
    _currentPos = value;
  }
  check(String index){
    sana=index;
    notifyListeners();
  }



}