import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_check_box.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          hintText: "Your number",
          keyboardType: TextInputType.phone,
        ),

        TextInputField(
          hintText: "Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          withBottomPadding: false,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
          child: Row(
            children: [
              CustomCheckBox(
                onChanged: (value) {},
              ),
              SizedBox(width: 6.w),
              Text(
                "Remember me",
                style: AppTextStyles.w400.copyWith(fontSize: 14),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  CustomNavigator.push(Routes.FORGET_PASSWORD);
                },
                splashColor: Colors.transparent,
                child: Text(
                  "Forgot Password?",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 14,
                    color: Styles.PRIMARY_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
