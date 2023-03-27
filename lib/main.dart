import 'package:flutter/material.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/auth/start_page.dart';
import 'package:memos/constants/constant.dart';
import 'package:memos/router/routers.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:memos/utils/no_splash_factory.dart';
import 'package:memos/view/behavior_view.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* final size = MediaQuery.of(context).size;
    Global.screenHeight = size.height;
    Global.screenWidth = size.width;*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'memos',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
          primaryColor: Colors.white,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplashFactory()),
      home: const MainPage(),
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}
