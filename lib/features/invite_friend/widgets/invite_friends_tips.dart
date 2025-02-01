import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/text_styles.dart';

class InviteFriendsTips extends StatelessWidget {
  const InviteFriendsTips({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tips = [
      {
        "title" : "Choose Tasks",
        "description" : "Please provide your name and email",
        "icon" : "ticket",
      },
      {
        "title" : "Complete the Task",
        "description" : "A few details about your company",
        "icon" : "blue-star",
      },
      {
        "title" : "Earn Rewards",
        "description" : "Finish the task and earn points to effort!",
        "icon" : "discount",
      },
    ];
    return Column(
      children: [
        SvgPicture.asset(Constants.getSvg("add-friend")),
        SizedBox(height: 24.h),
        Text(
          "Referral  A friend",
          style: AppTextStyles.w700.copyWith(fontSize: 24),
        ),
        SizedBox(height: 8.h),
        Text(
          "Your effort makes a difference—keep it up!",
          style: AppTextStyles.w400.copyWith(fontSize: 14),
        ),
        SizedBox(height: 24.h),
        ListView.separated(
          itemCount: tips.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Constants.getSvg(tips[index]["icon"])),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tips[index]["title"],
                        style: AppTextStyles.w500.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        tips[index]["description"],
                        style: AppTextStyles.w400.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
