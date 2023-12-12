import 'package:flutter/material.dart';
import 'package:memos/utils/SpUtils.dart';

class LangCurrentLocale with ChangeNotifier {
  ///汉语-简
  static const int CN = 0;

  ///英语
  static const int EN = 1;

  ///汉语-繁
  static const int TW = 2;

  ///日语
  static const int JP = 3;

  ///韩语
  static const int KR = 4;

  static const Locale _localeCN = Locale('zh', "CN");
  static const Locale _localeEN = Locale('en', "US");
  static const Locale _localeTW = Locale('zh', "TW");
  static const Locale _localeJP = Locale('ja', "JP");
  static const Locale _localeKR = Locale('ko', "KR");
  Locale _locale = getValue(SpUtil.getInt("LANG_SET")!);

  Locale get value => _locale;

  static Locale getValue(int index) {
    Locale result = _localeCN;
    switch (index) {
      case CN:
        result = _localeCN;
        break;
      case TW:
        result = _localeTW;
        break;
      case EN:
        result = _localeEN;
        break;
      case JP:
        result = _localeJP;
        break;
      case KR:
        result = _localeKR;
        break;
      default:
        result = _localeCN;
        break;
    }
    return result;
  }

  void setLocale(int index) {
    Locale locale = getValue(index);
    _locale = locale;
    notifyListeners();
  }
}
