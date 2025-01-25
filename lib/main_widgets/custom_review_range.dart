import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomReviewRange extends StatelessWidget {
  final String? title;
  final double? rate;
  final EdgeInsetsGeometry? padding;
  const CustomReviewRange({super.key, this.title, this.rate, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title ?? "",
                style: AppTextStyles.w500.copyWith(fontSize: 11),
              ),
              Spacer(),
              Text(
                "$rate",
                style: AppTextStyles.w500.copyWith(fontSize: 11),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Stack(
            children: [
              Container(
                height: 5,
                width: 350.w,
                decoration: BoxDecoration(
                  color: Styles.BORDER_COLOR,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              Container(
                height: 5,
                width: (350.w * rate!) / 10,
                decoration: BoxDecoration(
                  color: rate! <= 5 ? Styles.ACCENT_COLOR : Styles.PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
