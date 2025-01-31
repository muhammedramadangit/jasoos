import 'package:flutter/material.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class IdInformationSubmit extends StatelessWidget {
  const IdInformationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Save",
      padding: Styles.SCREEN_PADDING,
      onTap: () {},
    );
  }
}
