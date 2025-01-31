import 'package:flutter/material.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class BankAccountSubmit extends StatelessWidget {
  const BankAccountSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "save",
      padding: Styles.SCREEN_PADDING,
      onTap: () {
        BankAccountBloc.instance.changeEditStatus();
      },
    );
  }
}
