import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomEmptyView extends StatelessWidget {
  final String? message;
  final EdgeInsetsGeometry? padding;
  const CustomEmptyView({super.key, this.message, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Constants.getAsset("empty"),
            height: 160.h,
            width: 230.w,
          ),
          SizedBox(height: 36.h),
          Text(
            message ?? tr("emptyData"),
            style: AppTextStyles.w600.copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }
}
