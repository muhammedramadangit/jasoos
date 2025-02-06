import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';

AppBar homeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.3),
    toolbarHeight: 128.h,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.r),
        bottomRight: Radius.circular(32.r),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Styles.PRIMARY_COLOR,
              child: Center(
                child: Image.asset(Constants.getAsset("profile")),
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 20,
              backgroundColor: Styles.PRIMARY_COLOR,
              child: Center(
                child: SvgPicture.asset(Constants.getSvg("w-gift")),
              ),
            ),
            SizedBox(width: 12.w),
            CircleAvatar(
              radius: 20,
              backgroundColor: Styles.PRIMARY_COLOR,
              child: Center(
                child: SvgPicture.asset(Constants.getSvg("bell")),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
