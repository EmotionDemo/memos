
import 'package:flutter/material.dart';

class LangCurrentLocale with ChangeNotifier{
  static const int CN = 0;
  static const int EN = 1;
  static const int TW = 2;
  static const int JP = 3;
  static const int KN = 4;

  Locale _locale = const Locale('zh',"CN");
  Locale get value=>_locale;
  Locale getValue(int index){
    Locale result =  _locale;
    switch(index){
      case CN:


    }
    return result;
  }
  void setLocale(locale){
    _locale = locale;
    notifyListeners();
  }
}