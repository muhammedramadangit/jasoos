import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class RewardsHistory extends StatelessWidget {
  const RewardsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cashback History",
          style: AppTextStyles.w500.copyWith(fontSize: 16),
        ),
        ListView.separated(
          itemCount: 7,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 24.h),
          separatorBuilder: (context, index) => Styles.divider(ver: 12.h),
          itemBuilder: (context, index) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.5),
                  child: Center(
                    child: SvgPicture.asset(Constants.getSvg(index.isEven ? "cash-in" : "cash-out")),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        index.isEven ? "Reward" : "Cash out",
                        style: AppTextStyles.w500.copyWith(fontSize: 14),
                      ),
                      Text(
                        "12:49 pm",
                        style: AppTextStyles.w400.copyWith(
                          fontSize: 12,
                          color: Styles.GREY_TEXT_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "10 SAR",
                  style: AppTextStyles.w500.copyWith(
                    fontSize: 16,
                    color: index.isEven ? Styles.GREEN_TEXT_COLOR : Styles.RED_TEXT_COLOR,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
