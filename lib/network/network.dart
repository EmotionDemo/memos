import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:memos/beans/MemosBean.dart';
import 'package:memos/utils/my_cookie.dart';

import '../beans/LoginBean.dart';
import '../beans/MeBean.dart';
import '../beans/StatusBean.dart';
import '../beans/TagsBean.dart';
import '../constants/constant.dart';
import '../utils/SpUtils.dart';

// const String BASE_URL = "http://43.138.80.236:5230/";

const String login = "/api/auth/signin";
const String logOut = "/api/auth/signout";
const String userinfo = "/api/user/me";
const String tags = "/api/tag";
const String resource = "/api/resource";
const String me = "/api/user/me";
const String loginOpenApi = "/api/memo?openId=";
const String status = "/api/status";
const String getTags = "/api/tag";
const String getMemos = "/api/memo";
const String deleteMemos = "/api/memo/";

class HttpConfig {
  // static const baseUrl = BASE_URL;
  static const timeout = 3000;
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
}

class RequestManager {
  static RequestManager? _instance;
  Dio? _dio;
  PersistCookieJar? _cookieJar;
  bool isInitSecond = false;

  Dio get client => _dio!;

  factory RequestManager(String baseUrl) => getInstance(baseUrl);

  static getInstance(String baseUrl) {
    _instance ??= RequestManager._create(baseUrl);
    return _instance;
  }

  static getClient() {
    String basePath = SpUtil.getString(Global.BASE_PATH)!;
    if (basePath.isNotEmpty) {
      _instance ??= getInstance(basePath);
    }
    return _instance;
  }

  RequestManager._create(String baseUrl) {
    _initDio(baseUrl);
  }

  ///初始化dio
  Future<void> _initDio(String url, {String? openId}) async {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: url,
        connectTimeout: HttpConfig.CONNECT_TIMEOUT,
        receiveTimeout: HttpConfig.RECEIVE_TIMEOUT);
    if (openId == null) {}
    if (openId != null) {
      baseOptions.queryParameters = {"openId": openId};
      baseOptions.responseType = ResponseType.plain;
    }
    _cookieJar = await MyCookieJar.cookieJar;
    _dio = Dio(baseOptions);
    _dio!.interceptors
      ..add(LogInterceptor(requestBody: true, responseBody: true))
      ..add(CookieManager(_cookieJar!));
  }

  void destroy() {
    _dio!.close(force: true);
    _instance = null;
  }

  ///账号密码登录
  Future<UserInfoBean> loginService(
      String url, String username, String password) async {
    await _initDio(url);
    await _initCookie(url);
    await _initDio(url);
    var response = await _dio!.post(login, data: {
      "username": username,
      "password": password,
    }).catchError((e) {
      throw Exception("登录失败,请检查参数是否正确：$e");
    });
    if (response.statusCode != 200) {
      throw Exception("登录失败，请检查网络状况");
    }
    SpUtil.setBool(Global.isLoginFlag, true);
    print('isOk1--->${response.data}');
    return UserInfoBean.fromJson(response.data);
  }

  ///初始化cookie
  Future<void> _initCookie(String url) async {
    var cookies = await _cookieJar?.loadForRequest(Uri.parse(url + login));
    await _cookieJar!.saveFromResponse(Uri.parse(url + login), cookies!);
    await SpUtil.setString(Global.COOKIE_STR, cookies.toString());
  }

  //通过openid登录
  Future<StatusBean> loginOpenIdService(String openApi) async {
    var uri = Uri.parse(openApi);
    Pattern pattern = "//";
    var lastIndexOf = openApi.lastIndexOf(pattern);
    var head = openApi.substring(0, lastIndexOf + 2);
    var openId = uri.queryParameters["openId"];
    SpUtil.setString(Global.OPEN_API, openId.toString());
    if (openId == null || openId.isEmpty) {
      throw Exception("非法的openApi");
    }
    var host = uri.host;
    String path = "$head$host:${uri.port}";
    await _initDio(path);
    await _initCookie(path);
    await _initDio(path, openId: openId);
    //先调用me获取个人属性思密达
    var meResponse = await _dio!.get(me);
    if (meResponse.statusCode != 200) {
      throw Exception("登录信息获取失败");
    }
    //加载状态资源
    var loadStatusRes = await _dio!.get(status);
    if (loadStatusRes.statusCode != 200) {
      throw Exception("状态信息获取失败");
    }
    SpUtil.setBool(Global.isLoginFlag, true);
    SpUtil.setString(Global.BASE_PATH, path);
    print('isOk--->${loadStatusRes.data}');
    return StatusBean.fromJson(jsonDecode(loadStatusRes.data));
  }

  ///登出
  Future<bool> logout() async {
    // await _setNewDioFromRamCookieData();
    var response = await _dio!.post(logOut);
    if (response.statusCode != 200) {
      throw Exception("退出登录失败");
    }
    print('responsedata----->${response.data}');
    return response.data;
  }

  ///如果是从硬盘里面读出来的baseUrl，说明已经退出过APP，
  ///需要根据sp中的用户主机地址重新构建dio的client
  Future<void> _setNewDioFromRamCookieData() async {
    if (isInitSecond) {
      return;
    }
    String basePath = SpUtil.getString(Global.BASE_PATH)!;
    if (basePath.isNotEmpty) {
      await _initDio(basePath);
      isInitSecond = true;
    }
  }

  ///查询所有笔记
  Future<MemosBean> queryAllMemos(String memoType) async {
    Response response;
    if (memoType.isNotEmpty || memoType != "") {
      response =
          await _dio!.get(getMemos, queryParameters: {"rowStatus": memoType});
    } else {
      response = await _dio!.get(getMemos);
    }
    if (response.statusCode != 200) {
      throw Exception("查询所有memos失败");
    }
    return MemosBean.fromJson(response.data);
  }

  ///查看用户信息状态
  Future<StatusBean?> queryUserStatus() async {
    await _setNewDioFromRamCookieData();
    var response = await _dio!.get(status);
    if (response.statusCode != 200) {
      //查看用户信息状态失败
      print('查询用户状态信息失败${response.statusCode},${response.statusMessage}');
      return null;
    }
    return StatusBean.fromJson(response.data);
  }

  ///查询个人信息
  Future<MeBean?> queryMeInfo() async {
    await _setNewDioFromRamCookieData();
    var response = await _dio!.get(me);
    if (response.statusCode != 200) {
      return null;
    }
    return MeBean.fromJson(response.data);
  }


  ///查询所有笔记提交日期次数
  Future<List<String>> queryNoteDates() async {
    var response = await _dio!.get(getMemos);
    List<String> dateList = [];
    if (response.statusCode != 200) {
      throw Exception("[queryNoteDates],查询所有memos失败");
    }
    var memosBean = MemosBean.fromJson(response.data);
    for (var memosInfo in memosBean.data) {
      dateList.add(memosInfo.createdTs.toString());
    }
    return dateList;
  }

  ///查询所有tags
  Future<TagsBean> queryAllTags() async {
    await _setNewDioFromRamCookieData();
    var response = await _dio!.get(tags);
    if (response.statusCode != 200) {
      throw Exception("查询Tags失败");
    }
    return TagsBean.fromJson((response.data));
  }
  
  
  Future<bool> deleteMemo(String id)async {
    var response = await _dio!.delete(deleteMemos+"$id");
    if(response.statusCode!=200){
      print("删除id为${id}的memo失败 +${response.statusMessage}");
      return false;
    }
    return true;
  }
  
  
}
