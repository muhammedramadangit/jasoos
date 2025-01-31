import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jasoos/features/more/widgets/general_tabs.dart';
import 'package:jasoos/features/more/widgets/other_tabs.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Profile", back: false),
      body: SingleChildScrollView(
        padding: Styles.SCREEN_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Constants.getAsset("profile"),
                        height: 64.h,
                        width: 64.h,
                      ),
                      Positioned.directional(
                        bottom: 0,
                        start: 0,
                        textDirection: TextDirection.rtl,
                        child: SvgPicture.asset(Constants.getSvg("edit-fill")),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Muhamad Elhadedy",
                    style: AppTextStyles.w500.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "muhamadelhadedy@gmail.com",
                    style: AppTextStyles.w400.copyWith(
                      fontSize: 12,
                      color: Styles.GREY_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            GeneralTabs(),
            SizedBox(height: 10.h),
            OtherTabs(),
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    SvgPicture.asset(Constants.getSvg("logout")),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Out",
                            style: AppTextStyles.w500.copyWith(
                              fontSize: 14,
                              color: Styles.RED_TEXT_COLOR,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Logout from your account",
                            style: AppTextStyles.w400.copyWith(
                              fontSize: 12,
                              color: Styles.GREY_TEXT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Styles.DARK_GREY_COLOR,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
