import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil{
  static showToast({required String message,double? fontSize,ToastGravity? gravity, Color? background,Color? textColor}){
    Fluttertoast.showToast(msg: message,gravity: ToastGravity.CENTER,toastLength:Toast.LENGTH_SHORT);
  }
}
