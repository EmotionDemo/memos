import 'dart:math';

import 'package:flutter/material.dart';


class IndicatorWidget extends AnimatedWidget {
  const IndicatorWidget({
    super.key,
    required this.color,
    required this.controller,
    required this.itemCount,
  }) : super(listenable: controller);
  final PageController controller;
  final int itemCount;
  final Color color;
  static const double _IndicatorSize = 8.0;
  static const double _MaxZoom = 2.0;
  static const double _IndicatorSpacing = 20.0;

  Widget _createIndicator(int index) {
    print('mmmmmmmmmmmmmmmm');
    double selectedness = Curves.easeOut.transform(max(0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs()));
    double zoom = 1.0 + (_MaxZoom - 1.0) * selectedness;
    return SizedBox(
      width: _IndicatorSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: SizedBox(
            width: _IndicatorSize * zoom,
            height: _IndicatorSize * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _createIndicator),
      ),
    );
  }
}
