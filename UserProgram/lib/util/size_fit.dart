import 'dart:ui';

import 'package:flutter/src/widgets/framework.dart';
class HYSizeFit {
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double dpr = 0;
  static double statusHeight = 0;
  static double rpx = 0;
  static double px = 0;
  static void initialize( {double designWidth = 390, double designHeight = 844}) {
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    statusHeight = window.padding.top / dpr;
    rpx = screenWidth / designWidth;
    px = screenHeight / designHeight;
    // 如果设计稿宽高比例与屏幕宽高比例不一致，则取宽度和高度缩放比例中的最小值作为最终比例
    final double scale = rpx < px ? rpx : px;
    rpx = scale;
    px = scale;
  }
  static double setRpx(double size) {
    return rpx * size;
  }
  static double setPx(double size) {
    return px * size;
  }
}