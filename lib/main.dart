import 'package:flutter/material.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/auth/start_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memos/router/routers.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:memos/utils/no_splash_factory.dart';
import 'package:memos/view/behavior_view.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

void main() {
  runApp(const MyApp());


}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(style);
      //高刷
      try {
        FlutterDisplayMode.setHighRefreshRate();
      } catch (e) {}
    }

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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



