import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class LoginFirstDialog extends StatelessWidget {
  const LoginFirstDialog({super.key,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide.none),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => CustomNavigator.pop(),
                  child: Icon(Icons.close),
                ),
              ],
            ),
            Center(
              child: Lottie.asset(
                Constants.getLottie("alert"),
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              tr("loginFirst"),
              textAlign: TextAlign.center,
              style: AppTextStyles.w600.copyWith(fontSize: 16),
            ),
            SizedBox(height: 16.h),
            CustomButton(
              txtFontSize: 14,
              text: tr("login"),
              height: 50.h,
              onTap: () => AppStorage.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
