import 'package:flutter/material.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class OtpSubmit extends StatelessWidget {
  final bool? isForget;
  const OtpSubmit({super.key, this.isForget});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Verify",
      onTap: () {
        CustomNavigator.push(isForget == true ? Routes.SELECT_CATEGORY : Routes.SELECT_CATEGORY);
      },
    );
  }
}
