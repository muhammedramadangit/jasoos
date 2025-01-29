import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static const Color PRIMARY_COLOR = Color(0xff2103ED);
  static const Color ACCENT_COLOR = Color(0xffADC8FF);
  static const Color HIGHLIGHT_COLOR = Color(0xFFD6E4FF);
  static const Color SCAFFOLD_COLOR = Color(0xFFffffff);
  static const Color FILL_COLOR = Color(0xFFFDFDFF);
  static const Color BORDER_COLOR = Color(0xffD1D5DB);
  static const Color GREY_TEXT_COLOR = Color(0xff6B7280);
  static const Color GREEN_TEXT_COLOR = Color(0xff32A071);
  static const Color RED_TEXT_COLOR = Color(0xffF43F5D);
  static const Color MORE_COLOR = Color(0xffF6F6F6);
  static const Color TICKET_COLOR = Color(0xffE7E7E8);

  static const Color BLACK_COLOR = Color(0xff000000);
  static const Color DARK_GREY_COLOR = Color(0xff6A6A6A);
  static const Color GREY_COLOR = Color(0xff9CA3AF);
  static const Color LIGHT_GREY_BORDER = Color(0XFFEEEEEE);
  static const Color WHITE_COLOR = Color(0xffFFFFFF);
  static const Color RED_COLOR = Color(0xffFF472B);

  static List<Color> BACKGROUND_GRADIENT = [
    Color(0xffD1D3FF),
    Color(0xffF0EFF6).withOpacity(0.75),
    Color(0xffF6F6F9),
    Color(0xffFEFEFE),
  ];

  static EdgeInsets SCREEN_PADDING = EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h);

  static const String FONT_EN = 'en';
  static const String FONT_AR = 'ar';
  static BorderRadius borderRadius = BorderRadius.circular(10.0);

  static final Widget logo = Image.asset(
    'assets/images/logo.png',
    height: 190.0,
    width: 250.0,
    fit: BoxFit.contain,
  );
  static final Widget splash = Image.asset(
    'assets/splash.png',
    height: 158.0,
    width: 180.0,
  );

  static Widget divider({double? ver, double? hor, double? thickness}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hor ?? 0, vertical: ver ?? 0),
      child: Divider(color: BORDER_COLOR, thickness: thickness ?? 0.5, height: 4),
    );
  }
}
