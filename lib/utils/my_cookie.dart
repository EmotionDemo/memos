import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class MyCookieJar {
  static String? _cookiePath;

  static Future<String> get cookiePath async {
    if (_cookiePath == null) {
      Directory directory = await getApplicationDocumentsDirectory();
      _cookiePath = directory.path;
    }
    return _cookiePath!;
  }

  static PersistCookieJar? _cookieJar;

  static Future<PersistCookieJar> get cookieJar async {
    if (_cookieJar == null) {
      String path = await cookiePath;
      _cookieJar = PersistCookieJar(storage: FileStorage(path));
    }
    return _cookieJar!;
  }
}
