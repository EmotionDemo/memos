import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memos/utils/SpUtils.dart';

class ThemeController extends GetxController {

  final ThemeData redThemeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor: Colors.red,
      //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 15)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.transparent)));

  final ThemeData blueLightThemeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor: Colors.blue,
      //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 15)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.transparent)));

  final ThemeData blackDarkThemeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor: Colors.white10,
      //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 15)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.transparent)));

  final ThemeData whiteLightThemeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor: Colors.white,
      //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 15)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.transparent)));

  final ThemeData greenLightThemeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor: Colors.green,
      //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 15)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.transparent)));


  ThemeData switchThemeColor(int index) {
    switch (index) {
      case 0:
        return redThemeData;
      case 1:
        return blueLightThemeData;
      case 2:
        return blackDarkThemeData;
      case 3:
        return whiteLightThemeData;
      case 4:
        return greenLightThemeData;
      default:
        return whiteLightThemeData;
    }
  }

}

