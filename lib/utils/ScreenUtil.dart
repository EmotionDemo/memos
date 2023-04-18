import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ScreenUtil {
  static double hc_ScreenWidth() {
    return window.physicalSize.width / window.devicePixelRatio;
  }

  static double hc_ScreenHeight() {
    return window.physicalSize.height / window.devicePixelRatio;
  }

  static double hc_FitWidth(double width) {
    return hc_ScreenWidth() / 375.0 * width;
  }

  static double hc_FitHeight(double height) {
    return hc_ScreenHeight() / 667.0 * height;
  }
}
