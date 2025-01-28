import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          hintText: "Name",
          prefixIcon: SvgPicture.asset(Constants.getSvg("profile")),
          keyboardType: TextInputType.name,
        ),

        TextInputField(
          hintText: "Your number",
          keyboardType: TextInputType.phone,
        ),

        TextInputField(
          hintText: "Email",
          prefixIcon: SvgPicture.asset(Constants.getSvg("sms")),
          keyboardType: TextInputType.emailAddress,
        ),

        TextInputField(
          hintText: "Password",
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          keyboardType: TextInputType.visiblePassword,
          withBottomPadding: false,
        ),
      ],
    );
  }
}
