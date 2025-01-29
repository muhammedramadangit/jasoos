import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class ResetPasswordSuccessView extends StatelessWidget {
  const ResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(Constants.getSvg("success")),
            SizedBox(height: 24.h),
            Text(
              "Password changed successfully!",
              textAlign: TextAlign.center,
              style: AppTextStyles.w500.copyWith(fontSize: 24),
            ),
            SizedBox(height: 12.h),
            Text(
              "Your password has been changed successfully, we will let you know if there are more problems with your account",
              textAlign: TextAlign.center,
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
            ),

            Spacer(),
            CustomButton(
              text: "Continue Home",
              onTap: () {
                CustomNavigator.push(Routes.MAIN_PAGES);
              },
            ),
          ],
        ),
      ),
    );
  }
}
