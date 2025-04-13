import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class BankAccountSubmit extends StatelessWidget {
  const BankAccountSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankAccountBloc, AppState>(
      builder: (context, state) {
        return CustomButton(
          text: tr("save"),
          padding: Styles.SCREEN_PADDING,
          loading: state is Loading,
          onTap: () {
            BankAccountBloc.instance.add(Click());
          },
        );
      },
    );
  }
}
