import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class CustomBackButton extends StatelessWidget {
  final IconData? icon;
  final EdgeInsets? padding;
  const CustomBackButton({super.key, this.icon, this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => CustomNavigator.pop(),
          child: Container(
            height: 44.h,
            width: 44.h,
            margin: padding,
            decoration: BoxDecoration(
              color: Styles.SCAFFOLD_COLOR,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(icon ?? Icons.arrow_back_ios_new, color: Styles.PRIMARY_COLOR, size: 20.sp,),
            ),
          ),
        ),
      ],
    );
  }
}
