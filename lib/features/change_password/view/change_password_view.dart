import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: "Change password"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: Styles.SCREEN_PADDING,
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  TextInputField(
                    labelText: "Enter your current password",
                    hintText: "Enter your current password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 8.h),
                  TextInputField(
                    labelText: "Enter your new password",
                    hintText: "Enter your new password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 8.h),
                  TextInputField(
                    labelText: "Confirm your new password",
                    hintText: "Confirm your new password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            text: "Save",
            padding: Styles.SCREEN_PADDING,
          ),
        ],
      ),
    );
  }
}
