import 'dart:io';

import 'package:flutter/material.dart';
import '';
import '../view/LogIntypeSelectedButton.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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

  @override
  void initState() {
    super.initState();
    showInputType = showInputServerType;
    logInType = loginTypeNormal;
    loginTypeIcon = loginTypeIconOpenApi;
    showInputType = showInputServerType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Image.asset('images/ic_log_bg_4.png'),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20, top: 10),
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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: TextField(
                maxLines: 2,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 0, bottom: 0),
                  prefixIcon: const Icon(Icons.computer_sharp),
                  hintText: showInputType,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        style: BorderStyle.solid, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isShowPwdAndName,
                child: const SizedBox(
                  height: 20,
                )),
            Visibility(
                visible: isShowPwdAndName,
                maintainSize: false,
                maintainState: false,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "请输入用户名",
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                )),
            Visibility(
                visible: isShowPwdAndName,
                child: const SizedBox(
                  height: 20,
                )),
            Visibility(
              visible: isShowPwdAndName,
              maintainSize: false,
              maintainState: false,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      prefixIcon: const Icon(Icons.keyboard),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.key)),
                      hintText: "请输入密码",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 43,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(logInColorType),
                      foregroundColor:
                          MaterialStateProperty.all(logInColorType),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginTypeIcon,
                      const SizedBox(width: 5),
                      Text(
                        loginTypeTip,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  )),
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
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('没有账号？'),
                GestureDetector(
                  child: const Text(
                    '联系我',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
