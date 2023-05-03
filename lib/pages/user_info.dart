import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memos/auth/login_page.dart';
import 'package:memos/network/network.dart';
import 'package:memos/utils/ScreenUtil.dart';
import 'package:memos/utils/SpUtils.dart';
import 'package:memos/utils/file_utils.dart';
import 'package:memos/utils/toast.dart';
import 'package:share_plus/share_plus.dart';

import '../beans/LoginBean.dart';
import '../constants/constant.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late String userName;
  late String nickname;
  late String email;
  late String role;
  late String avatarurl;
  late String rowstatus;

  @override
  void initState() {
    super.initState();
    userName = SpUtil.getString(Global.USER_NAME)!;
    nickname = SpUtil.getString(Global.USER_NICK_NAME)!;
    email    = SpUtil.getString(Global.USER_EMAIL)!;
    role     = SpUtil.getString(Global.USER_ROLE)!;
    avatarurl= SpUtil.getString(Global.USER_AVATARURL)!;
    rowstatus= SpUtil.getString(Global.USER_ROWSTATUS)!;

    print('aaaa--->${userName}');
    print('aaaa--->${nickname},');
    print('aaaa--->${email},');
    print('aaaa--->${role},');
    print('aaaa--->${avatarurl}');
    print('aaaa--->${rowstatus}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          // alignment: Alignment.topRight,
          margin: EdgeInsets.only(left: ScreenUtil.hc_ScreenWidth() / 20),
          child: InkWell(
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black.withOpacity(0.5),
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: const Alignment(0.0, 1.0), //分析 2
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: ScreenUtil.hc_ScreenWidth() / 4,
                          height: ScreenUtil.hc_ScreenWidth() / 4,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellow,
                                  width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: ClipOval(
                            child: Image.memory(
                              base64.decode(avatarurl
                                  .split(',')
                                  .last),
                              fit: BoxFit.cover,
                              width: ScreenUtil.hc_ScreenWidth() / 4,
                              height: ScreenUtil.hc_ScreenWidth() / 4,
                            ),
                            /*child: Image.memory(
                          base64.decode(FileUtils.base64.split(',').last)
                        ),*/
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      width: 50,
                      height: 20,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          right: 5, bottom: 2, top: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/ic_lightning.png",
                              width: 20, height: 20),
                          Text(
                            'PRO',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "images/ic_authentication.png",
                      width: 18,
                      height: 18,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' ${email}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              Wrap(
                spacing: 10,
                children: [
                  Chip(
                    label: Text(
                      '👤  ${role}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      '💖  ${nickname}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      '🖥  ${rowstatus}',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7), fontSize: 12),
                    ),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              Container(
                height: 160,
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 15),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_lang.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '语言',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 5),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_share.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '分享',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                          onTap: () {
                            Share.share(
                                'hello，this is my app  https://example.com');
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_help.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '帮助',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 160,
                padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 15),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_font_size.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '字体大小',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 5),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_theme.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '主题颜色',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/contact_me");
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          indent: 20,
                          color: Colors.black12.withOpacity(0.05),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/ic_cache.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                '清除缓存',
                                style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.black26,
                                size: 25,
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: InkWell(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Container(
                      width: double.maxFinite,
                      // margin: const EdgeInsets.all(10),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        '退出登录',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  onTap: () {
                    Future<bool> logOutResult = RequestManager.getClient()
                        .logout();
                    logOutResult.then((value) {
                      SpUtil.clearSp().then((value) {
                        ToastUtil.showToast(message: "退出登录，释放相关内容");
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (builder) {
                              return const LoginPage();
                            }), (route) => route == null);
                      });
                    }).catchError((e) {
                      print('e--->${e}');
                    });
                    print('logout--->${logOutResult}');
                  },
                ),
              ),
            ],
          )),
    );
  }
}
