import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/otp/widgets/otp_count_down.dart';
import 'package:jasoos/features/otp/widgets/otp_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/otp_text_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90.h),
            Text(
              "Enter Verification Code",
              style: AppTextStyles.w500.copyWith(fontSize: 28),
            ),
            SizedBox(height: 8.h),
            Text(
              "We have sent a reset password to your Mobile Number",
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
            ),
            SizedBox(height: 60.h),
            OtpTextField(
              onChange: (value) {},
            ),
            SizedBox(height: 20.h),
            OtpSubmit(),
            SizedBox(height: 40.h),
            OtpCountDown(),
          ],
        ),
      ),
    );
  }
}
