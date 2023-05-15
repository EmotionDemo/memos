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

  //测量Item高度
  static double calculateItemHeight(String text, double width,double fontSize) {
    TextSpan textSpan = TextSpan(
      text: text,
      style: TextStyle(fontSize: fontSize),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: null,
    );
    textPainter.layout(maxWidth: width);
    return textPainter.size.height + 50.0;
  }
}
