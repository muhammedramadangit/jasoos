import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class AppBars {

  static titledAppBar({PreferredSizeWidget? bottom, Widget? titleWidget, String? title, double? elevation, Color? color, Color? titleColor, bool? back = true, VoidCallback? onBack, Widget? leading, List<Widget>? actions}) {
    return AppBar(
      elevation: elevation ?? 0,
      centerTitle: true,
      surfaceTintColor: Styles.SCAFFOLD_COLOR,
      backgroundColor: color ?? Styles.SCAFFOLD_COLOR,
      title: titleWidget ?? Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: AppTextStyles.w700.copyWith(fontSize: 14, color: titleColor ?? Styles.BLACK_COLOR),
      ),
      iconTheme: IconThemeData(color: titleColor ?? Styles.BLACK_COLOR),
      leading: back == true ? leading ?? IconButton(
        highlightColor: Colors.transparent,
        onPressed: () {
          if(onBack != null) {
            onBack();
          } else {
            CustomNavigator.pop();
          }
        },
        icon: Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new),
      ) : SizedBox(),
      actions: actions,
      bottom: bottom,
    );
  }

  static authAppBar({String? title, double? elevation, Color? color, bool? back = true, VoidCallback? onBack, List<Widget>? actions}) {
    return AppBar(
      elevation: elevation ?? 0,
      centerTitle: true,
      surfaceTintColor: Styles.SCAFFOLD_COLOR,
      backgroundColor: color ?? Styles.SCAFFOLD_COLOR,
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: AppTextStyles.w700.copyWith(fontSize: 14, color: Styles.BLACK_COLOR),
      ),
      leading: back != true ? SizedBox() : IconButton(
        onPressed: () => CustomNavigator.pop(),
        icon: SvgPicture.asset(Constants.getSvg("arrow-left")),
      ),
      actions: actions ?? [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SvgPicture.asset(Constants.getSvg("logo")),
        )
      ],
    );
  }
}