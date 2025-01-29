import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class GeneralTabs extends StatelessWidget {
  const GeneralTabs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        "icon" : "user-info",
        "title" : "Personal Information",
        "description" : "Detail your personal data",
        "onTap" : () {},
      },
      {
        "icon" : "id-info",
        "title" : "ID Information",
        "description" : "Settings for payment transactions",
        "onTap" : () {},
      },
      {
        "icon" : "bank",
        "title" : "Bank Account",
        "description" : "Settings for payment transactions",
        "onTap" : () {},
      },
      {
        "icon" : "gift",
        "title" : "Rewards",
        "description" : "Manage your account security",
        "onTap" : () {},
      },
      {
        "icon" : "safe",
        "title" : "Submissions",
        "description" : "Manage your submissions ",
        "onTap" : () {},
      },
      {
        "icon" : "group",
        "title" : "Invite Friends",
        "description" : "Share referral code and get bonus",
        "onTap" : () {},
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "General",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tabs[index]["title"],
                            style: AppTextStyles.w500.copyWith(fontSize: 14),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            tabs[index]["description"],
                            style: AppTextStyles.w400.copyWith(
                              fontSize: 12,
                              color: Styles.GREY_TEXT_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    SvgPicture.asset(Constants.getSvg("arrow-ios-right")),
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
