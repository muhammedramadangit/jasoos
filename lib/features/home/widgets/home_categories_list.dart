import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (context, index) => 16.horizontalSpace,
        itemBuilder: (context, index) {
          return Container(
            width: 60.w,
            // decoration: BoxDecoration(
            //   color: Styles.WHITE_COLOR,
            //   boxShadow: [
            //     BoxShadow(
            //         offset: Offset(0, 4),
            //         blurRadius: 4,
            //         spreadRadius: 0,
            //         color: Colors.black.withValues(alpha: 0.04)
            //     ),
            //   ],
            // ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Styles.BORDER_COLOR.withValues(alpha: 0.5),
                  child: Center(
                    child: SvgPicture.asset(Constants.getSvg("moneys")),
                  ),
                ),
                8.verticalSpace,
                Text(
                  "Value of Money",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.w500.copyWith(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
