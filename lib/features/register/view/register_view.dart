import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/register/widgets/register_form.dart';
import 'package:jasoos/features/register/widgets/register_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.authAppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: AppTextStyles.w500.copyWith(fontSize: 28),
            ),
            SizedBox(height: 8.h),
            Text(
              "Please create an account to find your dream job",
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
                color: Styles.GREY_TEXT_COLOR,
              ),
            ),
            SizedBox(height: 24.h),
            RegisterForm(),
            RegisterSubmit(),
          ],
        ),
      ),
    );
  }
}
