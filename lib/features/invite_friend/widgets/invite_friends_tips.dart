import 'package:easy_localization/easy_localization.dart';
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
        "title" : tr("chooseTasks"),
        "description" : tr("pleaseProvideYourNameAndEmail"),
        "icon" : "ticket",
      },
      {
        "title" : tr("completeTask"),
        "description" : tr("fewDetailsAboutYourCompany"),
        "icon" : "blue-star",
      },
      {
        "title" : tr("earnRewards"),
        "description" : tr("finishTaskAndEarnPoints"),
        "icon" : "discount",
      },
    ];
    return Column(
      children: [
        SvgPicture.asset(Constants.getSvg("add-friend")),
        SizedBox(height: 24.h),
        Text(
          tr("referralFriend"),
          style: AppTextStyles.w700.copyWith(fontSize: 24),
        ),
        SizedBox(height: 8.h),
        Text(
          tr("yourEffortMakesDifference"),
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
