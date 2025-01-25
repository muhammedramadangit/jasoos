import 'package:flutter/material.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

abstract class MediaQueryHelper {
  static get instance => MediaQuery.of(CustomNavigator.navigatorState.currentContext!);

  static Size get appMediaQuerySize => instance.size;

  static double get width => appMediaQuerySize.width;

  static double get height => appMediaQuerySize.height;

  static EdgeInsets get appMediaQueryPadding => instance.padding;

  static double get topPadding => appMediaQueryPadding.top;

  static EdgeInsets get appMediaQueryViewPadding => instance.viewPadding;

  static EdgeInsets get appMediaQueryViewInsets => instance.viewInsets;
}
