import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.authAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: AppTextStyles.w500.copyWith(fontSize: 28),
            ),
            SizedBox(height: 8.h),
            Text(
              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
            ),
            SizedBox(height: 40.h),

            TextInputField(
              hintText: "Your number",
              keyboardType: TextInputType.phone,
            ),
            Spacer(),
            CustomButton(
              text: "Next",
              onTap: () {
                CustomNavigator.push(Routes.OTP, arguments: true);
              },
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
