import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class RewardsBalance extends StatelessWidget {
  const RewardsBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Styles.HIGHLIGHT_COLOR.withValues(alpha: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Cashback Balance",
            style: AppTextStyles.w400.copyWith(
              fontSize: 14,
              color: Styles.DARK_GREY_COLOR,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: "10",
                  style: AppTextStyles.w700.copyWith(fontSize: 24),
                  children: [
                    TextSpan(
                      text: "SAR",
                      style: AppTextStyles.w400.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
                decoration: BoxDecoration(
                  color: Styles.WHITE_COLOR,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Row(
                  children: [
                    Text(
                      "Cash out",
                      style: AppTextStyles.w500.copyWith(fontSize: 12),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(Constants.getSvg("cash-out")),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
