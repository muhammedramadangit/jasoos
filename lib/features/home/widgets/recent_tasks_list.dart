import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';

class RecentTasksList extends StatelessWidget {
  const RecentTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 110.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: AssetImage(Constants.getAsset("burger")),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 110.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black.withValues(alpha: 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),

                PositionedDirectional(
                  end: 6,
                  top: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Styles.WHITE_COLOR,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: Styles.RED_TEXT_COLOR.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "50% OFF",
                          style: AppTextStyles.w700.copyWith(
                            fontSize: 12,
                            color: Styles.RED_TEXT_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name of the Resuratunt",
                  style: AppTextStyles.w500.copyWith(fontSize: 16),
                ),
                Row(
                  children: [
                    SvgPicture.asset(Constants.getSvg("star")),
                    4.horizontalSpace,
                    Text(
                      "Earned 50 Points",
                      style: AppTextStyles.w500.copyWith(
                        fontSize: 12,
                        color: Styles.GREEN_TEXT_COLOR,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],

        );
      },
    );
  }
}
