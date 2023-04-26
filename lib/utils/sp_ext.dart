
import 'package:shared_preferences/shared_preferences.dart';

extension SpExt on SharedPreferences{
  void setInt(String key,int value){
    setInt(key, value);
  }

}