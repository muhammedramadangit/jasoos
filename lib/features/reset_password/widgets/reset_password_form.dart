import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          hintText: "New Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
        ),
        SizedBox(height: 8.h),

        TextInputField(
          hintText: "Confirm New Password",
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
        ),
      ],
    );
  }
}
