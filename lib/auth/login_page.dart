import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/auth/main_page.dart';
import 'package:memos/constants/constant.dart';
import 'package:memos/utils/toast.dart';
import '../beans/LoginBean.dart';
import '../beans/StatusBean.dart';
import '../network/network.dart';
import '../utils/SpUtils.dart';
import '../view/logIntype_selected_button.dart';
import '../view/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var showInputServerType = "请输入服务器地址";
  var showInputOpenApiType = "请输入OpenApi";
  var showInputType;
  var logInType = "";
  var logInColorType = Colors.blue;
  var loginTypeNormal = "登录";
  var loginTypeOpenApi = "Open Api登录";
  var loginColorNormal = Colors.blue;
  var loginColorOpenApi = Colors.green;
  var loginTypeIcon;
  bool isShowPwdAndName = true;
  var loginTypeTip = "账号密码登录";
  var loginTypeIconOpenApi = const Icon(
    Icons.lock_open_outlined,
    size: 20,
    color: Colors.white,
  );

  var loginTypeIconOpenNormal = const Icon(
    Icons.login,
    size: 20,
    color: Colors.white,
  );
  var screenWidth;
  var screenHeight;
  late TextEditingController serverAddressController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;

  @override
  void initState() {
    super.initState();
    showInputType = showInputServerType;
    logInType = loginTypeNormal;
    loginTypeIcon = loginTypeIconOpenNormal;
    showInputType = showInputServerType;
    serverAddressController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset('images/ic_log_bg_4.png'),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, top: 5),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      maxLines: 2,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.center,
                      controller: serverAddressController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 0),
                        prefixIcon: const Icon(Icons.computer_sharp),
                        hintText: showInputType,
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: isShowPwdAndName,
                      child: const SizedBox(
                        height: 10,
                      )),
                  Visibility(
                      visible: isShowPwdAndName,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.center,
                          controller: usernameController,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: "请输入用户名",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                      )),
                  Visibility(
                      visible: isShowPwdAndName,
                      child: const SizedBox(
                        height: 10,
                      )),
                  Visibility(
                    visible: isShowPwdAndName,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 20, right: 20),
                            prefixIcon: const Icon(Icons.keyboard),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.key)),
                            hintText: "请输入密码",
                            hintStyle: const TextStyle(color: Colors.black26),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(12),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 43,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Button(
                      onClickListener: () {
                        var serverPath =
                            serverAddressController.text.toString();
                        var userName = usernameController.text.toString();
                        var password = passwordController.text.toString();
                        print("openapi--->${serverPath}");
                        if (isShowPwdAndName) {
                          if (serverPath.isEmpty ||
                              userName.isEmpty ||
                              password.isEmpty) {
                            ToastUtil.showToast(message: "输入的登录信息不正确");
                            return;
                          }
                          var instance = RequestManager.getInstance(serverPath);
                          //登录
                          Future<UserInfoBean> loginInfo = instance
                              .loginService(serverPath, userName, password);
                          loginInfo.then((value) {
                            print('alue00000---->${value}');
                            logInSuccessAndtoMainPage(context);
                            ToastUtil.showToast(message: "登陆成功");
                            Global.saveUserInfo(serverPath, value);
                          }).catchError((exception) {
                            print("1exception--->$exception");
                            ToastUtil.showToast(
                                message: "${exception.toString()}");
                          });
                        } else {
                          if (serverPath.isEmpty) {
                            ToastUtil.showToast(message: "输入的OpenId找不到");
                            return;
                          }
                          var instance = RequestManager.getInstance(serverPath);
                          //登录
                          Future<StatusBean> loginInfo =
                              instance.loginOpenIdService(serverPath);
                          loginInfo.then((value) {
                            logInSuccessAndtoMainPage(context);
                            ToastUtil.showToast(message: "登陆成功");
                            Global.saveUserInfoByOpenApi(value);
                          }).catchError((exception) {
                            print("exception-2-->$exception");
                            ToastUtil.showToast(
                                message: "${exception.toString()}");
                          });
                        }
                      },
                      title: loginTypeTip,
                      icon: loginTypeIcon,
                      colorBg: logInColorType,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 130,
                        margin: const EdgeInsets.only(left: 20),
                        color: Colors.black12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(color: Colors.black26),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 1,
                        width: 130,
                        margin: const EdgeInsets.only(right: 20),
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: const Text(
                              '选择登录方式',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          LoginTypeSelectedButton(onLoginTypeSelected: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              if (value == 0) {
                                logInColorType = loginColorNormal;
                                loginTypeTip = "账号密码登录";
                                loginTypeIcon = loginTypeIconOpenNormal;
                                isShowPwdAndName = true;
                                showInputType = showInputServerType;
                              } else if (value == 1) {
                                loginTypeTip = "Open Api登录";
                                logInColorType = loginColorOpenApi;
                                loginTypeIcon = loginTypeIconOpenApi;
                                isShowPwdAndName = false;
                                showInputType = showInputOpenApiType;
                              }
                            });
                          }),
                        ],
                      )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(bottom: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('没有账号？'),
                        GestureDetector(
                          child: const Text(
                            '联系我',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/contact_me");
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  void logInSuccessAndtoMainPage(BuildContext context) {
    var isLogin = SpUtil.getBool(Global.isLoginFlag);
    if (isLogin!) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return const MainPage();
      }), (route) => route == null);
    }
  }
}
