import 'dart:io';

import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    prefixIcon: const Icon(Icons.computer_sharp),
                    hintText: "请输入服务器地址",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "请输入密码",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
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
            Container(
              width: double.infinity,
              height: 43,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.login,color: Colors.white,),
                      SizedBox(width: 5),
                      Text(
                        '登录',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
