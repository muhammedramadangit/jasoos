import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/otp/bloc/otp_bloc.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class OtpSubmit extends StatelessWidget {
  final bool? isForget;

  const OtpSubmit({super.key, this.isForget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpBloc, AppState>(
      builder: (context, state) {
        return CustomButton(
          text: tr("verify"),
          loading: state is Loading,
          disable: OtpBloc.instance.code.text.isEmpty,
          onTap: () {
            OtpBloc.instance.add(Click(arguments: isForget));
          },
        );
      },
    );
  }
}
