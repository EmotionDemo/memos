
import 'package:flutter/material.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/auth/start_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memos/beans/MeBean.dart';
import 'package:memos/beans/TagsBean.dart';
import 'package:memos/pages/add_page.dart';
import 'package:memos/pages/error_page.dart';
import 'package:memos/router/routers.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:memos/utils/LangCurrentLocale.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/no_splash_factory.dart';
import 'package:memos/utils/toast.dart';
import 'package:memos/view/behavior_view.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'beans/StatusBean.dart';
import 'constants/constant.dart';
import 'generated/l10n.dart';
import 'network/network.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Widget firstRoutePage = Container();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initStoragePermission().then((permissionOk) {
    if (permissionOk) {
      SpUtil.getInstance().then((value) {
        var isLogin = SpUtil.getBool(Global.isLoginFlag);
        if (isLogin!) {
          //更新用户信息
          Future<MeBean?> queryUserStatus =
              RequestManager.getClient().queryMeInfo();
          queryUserStatus.then((meData) {
            if (meData != null) {
              Global.updateUserInfo(meData);
              firstRoutePage = const MainPage();
            } else {
              if (Global.INIT_STATUS == -1) {
                firstRoutePage = const LoginPage();
              } else if (Global.INIT_STATUS == -2) {
                firstRoutePage = const MainPage();
                ToastUtil.showToast(message: "连接超时");
              } else {
                firstRoutePage = const ErrorPage();
              }
            }
            Future<TagsBean> allTags =
                RequestManager.getClient().queryAllTags();
            allTags.then((value) {
              Global.saveUserTagsInfo(value);
            });
            startActivity();
          }).catchError((error) {
            print('queryUserStatus error,info->${error}');
          });
        } else {
          firstRoutePage = const LoginPage();
          startActivity();
        }
      });
    }
  });
}

///启动！
void startActivity() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LangCurrentLocale>(create: (context) => LangCurrentLocale())
    ],
    child: const MyApp(),
  ));
}

///获取权限
Future<bool> _initStoragePermission() async {
  PermissionStatus statusStorage = await Permission.storage.request();
  PermissionStatus externalStorage =
      await Permission.manageExternalStorage.request();
  PermissionStatus camera = await Permission.camera.request();
  if (statusStorage.isGranted &&
      externalStorage.isGranted &&
      camera.isGranted) {
    print('已经获取读、写、相机权限');
    return true;
  } else if (statusStorage.isPermanentlyDenied ||
      externalStorage.isPermanentlyDenied) {
    await openAppSettings();
    return false;
  } else {
    print('permission denied');
    return false;
  }
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
    // 强制应用程序保持竖屏方向
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Consumer<LangCurrentLocale>(
      builder: (context,currentLocale,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate
          ],
          locale: currentLocale.value,
          supportedLocales: S.delegate.supportedLocales,
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
          // initialRoute: firstRoutePage,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );

  }
}
