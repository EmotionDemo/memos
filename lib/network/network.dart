import 'package:dio/dio.dart';

import '../beans/LoginBean.dart';

// const String BASE_URL = "http://43.138.80.236:5230/";

const String login = "api/auth/signin";
const String logOut = "/api/auth/signout";
const String userinfo = "/api/user/me";
const String tags = "/api/tag";
const String resource = "/api/resource";
const String me = "/api/user/me";

class HttpConfig {
  // static const baseUrl = BASE_URL;
  static const timeout = 3000;
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
}

class RequestManager {
  static RequestManager? _instance;
  late Dio _dio;

  Dio get client => _dio;

  factory RequestManager(String baseUrl) => getInstance(baseUrl);

  static getInstance(String baseUrl) {
    _instance ??= RequestManager._create(baseUrl);
    return _instance;
  }

  static getClient() {
    return _instance;
  }

  RequestManager._create(String baseUrl) {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: HttpConfig.CONNECT_TIMEOUT,
        receiveTimeout: HttpConfig.RECEIVE_TIMEOUT);
    initDio(baseUrl);
  }

  void initDio(String url) {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: url,
        connectTimeout: HttpConfig.CONNECT_TIMEOUT,
        receiveTimeout: HttpConfig.RECEIVE_TIMEOUT);
    _dio = Dio(baseOptions);
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  void destroy() {
    _dio.close(force: true);
    _instance = null;
  }

  Future<LoginBean> loginService(String url, String username,
      String password) async {
    initDio(url);
    var response = await _dio.post(login, data: {
      "username": username,
      "password": password,
    }).catchError((e) {
      print("eee--->${e}");
      throw Exception("登录失败,请检查参数是否正确：$e");
    });
    if (response.statusCode != 200) {
      throw Exception("登录失败，请检查网络状况");
    }
    return LoginBean.fromJson(response.data);
  }

  Future<LoginBean> loginOpenIdService(String openApi) async {
    var uri = Uri.parse(openApi);
    var openId = uri.queryParameters["openId"];
    if (openId == null || openId.isEmpty) {
      throw Exception("非法的openApi");
    }
    var host = uri.fragment.toString();
    var response = await _dio.get(host);
    if (response.statusCode != 200) {
      throw Exception("登录失败");
    }
    return LoginBean.fromJson(response.data);
  }
}
