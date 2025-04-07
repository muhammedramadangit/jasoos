import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_storage.dart';
import '../../../helper/constants.dart';
import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../../../main_widgets/custom_button.dart';
import '../../../navigation/custom_navigation.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide.none),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Lottie.asset(
                Constants.getLottie("alert"),
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Log out of your account?",
              textAlign: TextAlign.center,
              style: AppTextStyles.w600.copyWith(fontSize: 16),
            ),
            SizedBox(height: 8.h),
            Text(
              "You will be securely signed out from this device",
              textAlign: TextAlign.center,
              style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.GREY_TEXT_COLOR),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    color: Styles.SCAFFOLD_COLOR,
                    borderColor: Styles.GREY_TEXT_COLOR,
                    txtColor: Styles.GREY_TEXT_COLOR,
                    txtFontSize: 14,
                    text: "Cancel",
                    radius: 8,
                    height: 40.h,
                    onTap: () => CustomNavigator.pop(),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    color: Styles.RED_COLOR,
                    radius: 8,
                    txtFontSize: 14,
                    text: "Sign out",
                    height: 40.h,
                    onTap: () => AppStorage.signOut(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}