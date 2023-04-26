import 'package:flutter/material.dart';
import 'package:memos/view/button.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  var usernameInputController;
  var passwordInputController;
  var emailAddressInputController;
  var greatIdeaController;

  var username = "";
  var password = "";
  var emailAddress = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameInputController = TextEditingController();
    passwordInputController = TextEditingController();
    emailAddressInputController = TextEditingController();
    greatIdeaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = size.width;
    var screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text(
                    'Join us',
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text(
                      'Our friendly team would love to hear from you !'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text('用户名'),
                    ),
                    Container(
                      width: screenWidth / 2.2,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text('密码'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  //交叉轴的布局方式，对于column来说就是水平方向的布局方式
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //就是字child的垂直布局方向，向上还是向下
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(left: 10, right: 5),
                          width: screenWidth / 2.2,
                          child: TextField(
                            controller: usernameInputController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 20, top: 0, bottom: 0),
                                hintText: "用户名",
                                hintStyle: const TextStyle(color: Colors.black26),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                              right: 10, top: 10, left: 5),
                          width: screenWidth / 2.2,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 0, bottom: 0),
                              hintText: "密码",
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            controller: passwordInputController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text('Email'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 10, right: 20, top: 0, bottom: 0),
                      hintText: "联系方式",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    controller: emailAddressInputController,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  child: Text('好的想法'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: TextField(
                    controller: greatIdeaController,
                    textAlignVertical: TextAlignVertical.center,
                    maxLines: 7,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      hintText: "好的想法",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  height: 43,
                  child: Button(
                    onClickListener: (){
                      print('flutter ----111');
                    },
                    title: '提交',
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
