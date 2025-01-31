import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class OtherTabs extends StatelessWidget {
  const OtherTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        "icon" : "notification",
        "title" : "Notifications",
        "onTap" : () {
          CustomNavigator.push(Routes.NOTIFICATION_SETTING);
        },
      },
      {
        "icon" : "security",
        "title" : "Security & Password",
        "onTap" : () {
          CustomNavigator.push(Routes.SECURITY_AND_PASSWORD);
        },
      },
      {
        "icon" : "global",
        "title" : "Language",
        "onTap" : () {
          CustomNavigator.push(Routes.LANGUAGE);
        },
      },
      {
        "icon" : "message",
        "title" : "Help Center",
        "onTap" : () {
          CustomNavigator.push(Routes.HELP);
        },
      },
      {
        "icon" : "message",
        "title" : "Contact Us",
        "onTap" : () {},
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Other",
          style: AppTextStyles.w500.copyWith(fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 14.h),
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListView.separated(
            itemCount: tabs.length,
            padding: EdgeInsets.zero,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Styles.divider(ver: 12),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: tabs[index]["onTap"],
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    SvgPicture.asset(Constants.getSvg(tabs[index]["icon"])),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        tabs[index]["title"],
                        style: AppTextStyles.w500.copyWith(fontSize: 14),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
