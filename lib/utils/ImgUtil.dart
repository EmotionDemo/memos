import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImgUtil {
  static List<String> getImgFromTxt(String content) {
    final RegExp regex = RegExp(r'!\[.*?\]\((.*?)\)');
    final Iterable<Match> matches = regex.allMatches(content);
    final List<String> links = [];

    for (final match in matches!) {
      links.add(match.group(1)!);
    }

    return links;
  }

  static Future<int?> getImageHeight(String imageUrl) async {
    Completer<int> completer = Completer();
    print('imageUrl----->${imageUrl}');

    Image image = Image.network(imageUrl);

    void listener(ImageInfo info, bool synchronousCall) {
      final int height = info.image.height;
      completer.complete(height);
      image.image.evict();
    }

    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener(listener));
    return completer.future;
  }
}
