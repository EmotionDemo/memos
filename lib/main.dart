import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/auth/start_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memos/router/routers.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/no_splash_factory.dart';
import 'package:memos/view/behavior_view.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/constant.dart';

Widget firstRoutePage = Container();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initStoragePermission().then((permissionOk){
    if(permissionOk){
      SpUtil.getInstance().then((value) {
        var isLogin = SpUtil.getBool(Global.isLoginFlag);
        if (isLogin!) {
          firstRoutePage = const MainPage();
        } else {
          firstRoutePage = const LoginPage();
        }
        runApp(const MyApp());
      });
    }
  });


}



Future<bool> _initStoragePermission() async{
  PermissionStatus statusStorage = await Permission.storage.request();
  PermissionStatus externalStorage = await Permission.manageExternalStorage.request();
  if(statusStorage.isGranted && externalStorage.isGranted){
    print('已经获取读写权限');
    return true;
  }else if (statusStorage.isPermanentlyDenied || externalStorage.isPermanentlyDenied){
    await openAppSettings();
    return false;
  }else{
    print('permission denied');
    return false;
  }
}

/// @Description:获取存储路径
/// @Author: 李丰华
/// @CreateDate: 2023/1/16 11:46
Future<String> _setFileStoragePath() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  print('appDocDirectory path --->${appDocDirectory.path}');
  return appDocDirectory.path;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var startPage = "";

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      );
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
          brightness: Brightness.light,
          primaryColor: const Color.fromARGB(242, 197, 188, 188),
          scaffoldBackgroundColor: const Color.fromARGB(189, 255, 255, 255),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplashFactory()),
      home: firstRoutePage,
      // initialRoute: firstRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }


}
