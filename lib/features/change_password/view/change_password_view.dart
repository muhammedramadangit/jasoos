import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/change_password/widgets/change_password_form.dart';
import 'package:jasoos/features/change_password/widgets/change_password_submit.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

import '../bloc/change_password_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.titledAppBar(title: tr("changePassword")),
      body: BlocBuilder<ChangePasswordBloc, AppState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            bottom: true,
            child: Column(
              children: [
                ChangePasswordForm(),
                ChangePasswordSubmit(),
              ],
            ),
          );
        },
      ),
    );
  }
}
