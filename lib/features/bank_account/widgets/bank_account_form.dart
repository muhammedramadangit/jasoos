import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

import '../../../core/app_event.dart';

class BankAccountForm extends StatelessWidget {
  const BankAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    BankAccountBloc bloc = BankAccountBloc.instance;
    return Column(
      children: [
        TextInputField(
          labelText: tr("bankName"),
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          readOnly: !bloc.canEdit,
          controller: bloc.bankName,
          errorText: bloc.bankNameError,
          hasError: !bloc.bankNameValidation,
          onChange: (value) {
            if (!bloc.bankNameValidation) {
              bloc.bankNameValidation = true;
            }
            bloc.add(Update());
          },
        ),
        TextInputField(
          labelText: tr("holderName"),
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.name,
          readOnly: !bloc.canEdit,
          controller: bloc.holderName,
          errorText: bloc.holderNameError,
          hasError: !bloc.holderNameValidation,
          onChange: (value) {
            if (!bloc.holderNameValidation) {
              bloc.holderNameValidation = true;
            }
            bloc.add(Update());
          },
        ),
        TextInputField(
          labelText: tr("iban"),
          labelStyle: AppTextStyles.w500.copyWith(fontSize: 16, color: Styles.GREY_TEXT_COLOR),
          keyboardType: TextInputType.text,
          readOnly: !bloc.canEdit,
          controller: bloc.iban,
          errorText: bloc.ibanError,
          hasError: !bloc.ibanValidation,
          onChange: (value) {
            if (!bloc.ibanValidation) {
              bloc.ibanValidation = true;
            }
            bloc.add(Update());
          },
        ),
      ],
    );
  }
}
