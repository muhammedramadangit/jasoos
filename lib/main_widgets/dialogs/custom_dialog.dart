import 'package:flutter/material.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  final String? msg;
  final Widget? actions;

  const CustomDialog({super.key, this.msg, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Container(
        // height: 270.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              Constants.getLottie("alert"),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                msg!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Styles.GREY_TEXT_COLOR,
                ),
              ),
            ),
            if (actions != null) SizedBox(height: 20.h),
            actions ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
