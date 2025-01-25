import 'package:flutter/material.dart';
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
        icon: Icon(Icons.arrow_back_ios_new),
      ) : SizedBox(),
      actions: actions,
      bottom: bottom,
    );
  }

  static authAppBar({String? title, double? elevation, Color? color, bool? back, VoidCallback? onBack, List<Widget>? actions}) {
    return AppBar(
      elevation: elevation ?? 0,
      centerTitle: true,
      backgroundColor: color ?? Styles.SCAFFOLD_COLOR,
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: AppTextStyles.w700.copyWith(fontSize: 14, color: Styles.BLACK_COLOR),
      ),
      leading: IconButton(
        onPressed: () => CustomNavigator.pop(),
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      actions: actions,
    );
  }
}