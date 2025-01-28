import 'package:flutter/material.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class ResetPasswordSubmit extends StatelessWidget {
  const ResetPasswordSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Reset password",
      onTap: () {
        CustomNavigator.push(Routes.RESET_PASSWORD_SUCCESS);
      },
    );
  }
}
