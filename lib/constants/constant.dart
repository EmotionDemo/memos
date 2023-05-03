import '../beans/LoginBean.dart';
import '../beans/StatusBean.dart';
import '../utils/SpUtils.dart';

class Global {
  //屏幕长宽
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static const String isLoginFlag = "isLogin";
  static const String COOKIE_STR = "cookie";
  static const String OPEN_API = "OPENAPI";
  static const String BASE_PATH = "BASE_PATH";
  static const String USER_INFO = "userInfoBean";

  static const String USER_NAME = "USER_NAME";
  static const String USER_NICK_NAME = "USER_NICK_NAME";
  static const String USER_EMAIL = "USER_EMAIL";
  static const String USER_ROLE = "USER_ROLE";
  static const String USER_AVATARURL = "AVATARURL";
  static const String USER_ROWSTATUS = "ROWSTATUS";

  static const String LOGIN_SERVICE = "LOGIN_SERVICE";

  ///更新用户信息
  static void updateUserInfo(StatusBean statusData) {
    if (SpUtil.getString(Global.USER_NAME)! != statusData.data.host.username) {
      SpUtil.setString(Global.USER_NAME, statusData.data.host.username);
    }

    if (SpUtil.getString(Global.USER_NICK_NAME)! !=
        statusData.data.host.nickname) {
      SpUtil.setString(Global.USER_NICK_NAME, statusData.data.host.nickname);
    }

    if (SpUtil.getString(Global.USER_EMAIL)! != statusData.data.host.email) {
      SpUtil.setString(Global.USER_EMAIL, statusData.data.host.email);
    }

    if (SpUtil.getString(Global.USER_ROLE)! != statusData.data.host.role) {
      SpUtil.setString(Global.USER_ROLE, statusData.data.host.role);
    }

    if (SpUtil.getString(Global.USER_AVATARURL)! !=
        statusData.data.host.avatarUrl) {
      SpUtil.setString(Global.USER_AVATARURL, statusData.data.host.avatarUrl);
    }
    if (SpUtil.getString(Global.USER_ROWSTATUS)! !=
        statusData.data.host.rowStatus) {
      SpUtil.setString(Global.USER_ROWSTATUS, statusData.data.host.rowStatus);
    }
  }

  ///存储用户信息
  static void saveUserInfo(String serverPath, UserInfoBean value) {
    SpUtil.setString(Global.BASE_PATH, serverPath);
    SpUtil.setString(Global.USER_INFO, value.toString());
    SpUtil.setBool(Global.LOGIN_SERVICE, true);
    SpUtil.setString(Global.USER_NAME, value.data.username);
    SpUtil.setString(Global.USER_NICK_NAME, value.data.nickname);
    SpUtil.setString(Global.USER_EMAIL, value.data.email);
    SpUtil.setString(Global.USER_ROLE, value.data.role);
    SpUtil.setString(Global.USER_AVATARURL, value.data.avatarUrl);
    SpUtil.setString(Global.USER_ROWSTATUS, value.data.rowStatus);
  }

  ///存储OpenApi登录时的用户信息
  static void saveUserInfoByOpenApi(StatusBean value) {
    SpUtil.setString(
        Global.USER_NAME, value.data.host.username);
    SpUtil.setString(Global.USER_NICK_NAME,
        value.data.host.nickname);
    SpUtil.setString(
        Global.USER_EMAIL, value.data.host.email);
    SpUtil.setString(
        Global.USER_ROLE, value.data.host.role);
    SpUtil.setString(Global.USER_AVATARURL,
        value.data.host.avatarUrl);
    SpUtil.setString(Global.USER_ROWSTATUS,
        value.data.host.rowStatus);
    SpUtil.setBool(Global.LOGIN_SERVICE, false);
  }


}
