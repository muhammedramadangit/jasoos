import 'package:flutter/material.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class BankAccountForm extends StatelessWidget {
  const BankAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    BankAccountBloc bloc = BankAccountBloc.instance;
    return Column(
      children: [
        TextInputField(
          labelText: "Bank Name",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          readOnly: !bloc.canEdit,
          controller: TextEditingController(text: "SNB Bank"),
        ),
        TextInputField(
          labelText: "Holder Name",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          readOnly: !bloc.canEdit,
          controller: TextEditingController(text: "Muhamad Elhadedy"),
        ),
        TextInputField(
          labelText: "IBAN",
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.text,
          readOnly: !bloc.canEdit,
          controller: TextEditingController(text: "CUOHIHYFYT5678987986778"),
        ),
      ],
    );
  }
}
