import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class ResetPasswordSubmit extends StatelessWidget {
  const ResetPasswordSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, AppState>(
      builder: (context, state) {
        return CustomButton(
          text: "Reset password",
          loading: state is Loading,
          onTap: () {
            ResetPasswordBloc.instance.add(Click());
          },
        );
      },
    );
  }
}
