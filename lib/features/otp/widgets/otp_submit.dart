import 'package:flutter/material.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class OtpSubmit extends StatelessWidget {
  const OtpSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Verify",
      onTap: () {
        CustomNavigator.push(Routes.SELECT_CATEGORY);
      },
    );
  }
}
