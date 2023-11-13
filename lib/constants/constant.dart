import 'package:memos/beans/TagsBean.dart';

import '../beans/LoginBean.dart';
import '../beans/MeBean.dart';
import '../beans/StatusBean.dart';
import '../utils/SpUtils.dart';
import '../utils/file_utils.dart';

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
  static const String USER_LOGIN_DAYS = "USER_LOGIN_DAYS";
  static const String USER_MEMOS_NUM = "USER_MEMOS_NUM";

  static const String LOGIN_SERVICE = "LOGIN_SERVICE";

  static const String MEMO_TYPE_NORMAL = "NORMAL";
  static const String MEMO_TYPE_ARCHIVED = "ARCHIVED";
  static const String CONTENT_TYPE_IMAGE = "image";

  static const String TAG_NUMS = "tagNums";
  static const String TAGS = "TAGS_REAL";

  static int INIT_STATUS = 0;

  // if (_isKeyboardShow && _isShowTags) {
  //       _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() / 2.45;
  //     } else if (_isKeyboardShow && !_isShowTags) {
  //       _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() /2.1;
  //     } else if (!_isKeyboardShow && _isShowTags) {
  //       _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() / 1.38;
  //     } else if (!_isKeyboardShow && !_isShowTags) {
  //       _notInputFiledHeight = ScreenUtil.hc_ScreenHeight() / 1.26;
  //     }

  static const double HEIGHT_RATE_KEYBOARD_AND_TAG = 2.45;
  static const double HEIGHT_RATE_KEYBOARD_AND_NOT_TAG = 2.1;
  static const double HEIGHT_RATE_BOT_KEYBOARD_AND_TAG = 1.38;
  static const double HEIGHT_RATE_BOT_KEYBOARD_AND_NOT_TAG = 1.26;

  ///更新用户信息
  static void updateUserInfo(MeBean statusData) {
    if (SpUtil.getString(Global.USER_NAME)! != statusData.data.username) {
      SpUtil.setString(Global.USER_NAME, statusData.data.username);
    }

    if (SpUtil.getString(Global.USER_NICK_NAME)! != statusData.data.nickname) {
      SpUtil.setString(Global.USER_NICK_NAME, statusData.data.nickname);
    }

    if (SpUtil.getString(Global.USER_EMAIL)! != statusData.data.email) {
      SpUtil.setString(Global.USER_EMAIL, statusData.data.email);
    }

    if (SpUtil.getString(Global.USER_ROLE)! != statusData.data.role) {
      SpUtil.setString(Global.USER_ROLE, statusData.data.role);
    }

    if (SpUtil.getString(Global.USER_AVATARURL)! != statusData.data.avatarUrl) {
      SpUtil.setString(Global.USER_AVATARURL, statusData.data.avatarUrl);
    }
    if (SpUtil.getString(Global.USER_ROWSTATUS)! != statusData.data.rowStatus) {
      SpUtil.setString(Global.USER_ROWSTATUS, statusData.data.rowStatus);
    }
    if (SpUtil.getInt(Global.USER_LOGIN_DAYS).toString() !=
        statusData.data.createdTs.toString()) {
      SpUtil.setInt(Global.USER_LOGIN_DAYS, statusData.data.createdTs);
    }
  }

  ///存储tags信息
  static void saveUserTagsInfo(TagsBean tagsBean) {
    if (tagsBean == null) {
      return;
    }
    SpUtil.setInt(Global.TAG_NUMS, tagsBean.data.length);
    SpUtil.setString(Global.TAGS, FileUtils.listToString(tagsBean.data)!);
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
    SpUtil.setString(Global.USER_NAME, value.data.host.username);
    SpUtil.setString(Global.USER_NICK_NAME, value.data.host.nickname);
    SpUtil.setString(Global.USER_EMAIL, value.data.host.email);
    SpUtil.setString(Global.USER_ROLE, value.data.host.role);
    SpUtil.setString(Global.USER_AVATARURL, value.data.host.avatarUrl);
    SpUtil.setString(Global.USER_ROWSTATUS, value.data.host.rowStatus);
    SpUtil.setBool(Global.LOGIN_SERVICE, false);
  }
}
