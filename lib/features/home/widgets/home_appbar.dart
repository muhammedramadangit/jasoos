import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

AppBar homeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.3),
    toolbarHeight: 110.h,
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
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Styles.WHITE_COLOR,
                  child: Center(
                    child: Image.asset(Constants.getAsset("profile")),
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.WHITE_COLOR,
                    border: Border.all(color: Styles.ACCENT_COLOR),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "12",
                        style: AppTextStyles.w500.copyWith(
                          fontSize: 14,
                          color: Styles.PRIMARY_COLOR,
                        ),
                      ),
                      4.horizontalSpace,
                      SvgPicture.asset(Constants.getSvg("star-move"),
                        colorFilter: ColorFilter.mode(Styles.PRIMARY_COLOR, BlendMode.srcIn),
                      ),
                    ],
                  ),
                ),
              ],
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
