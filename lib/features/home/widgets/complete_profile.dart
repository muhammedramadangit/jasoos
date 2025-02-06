import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Styles.WHITE_COLOR,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Styles.BORDER_COLOR)
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Complete Profile ",
                  style: AppTextStyles.w500.copyWith(fontSize: 14),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Add your details to unlock the full experience.",
                  style: AppTextStyles.w400.copyWith(fontSize: 10),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          width: 250.w,
                          decoration: BoxDecoration(
                            color: Styles.BORDER_COLOR,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: (250.w * 3) / 4,
                          decoration: BoxDecoration(
                            color: Styles.PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "3/4",
                      style: AppTextStyles.w700.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.arrow_forward_ios, size: 16,),
        ],
      ),
    );
  }
}
