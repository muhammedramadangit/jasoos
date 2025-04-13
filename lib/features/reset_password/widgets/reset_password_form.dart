import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/main_widgets/fields/text_input_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordBloc bloc = ResetPasswordBloc.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputField(
          hintText: tr("newPassword"),
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          controller: bloc.password,
          errorText: bloc.passwordError,
          hasError: !bloc.passwordValidation,
          hasValidationHint: true,
          validationHint: tr("passwordLength"),
          onChange: (value) {
            if (!bloc.passwordValidation) {
              bloc.passwordValidation = true;
            }
            bloc.add(Update());
          },
        ),
        SizedBox(height: 8.h),

        TextInputField(
          hintText: tr("confirmNewPassword"),
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: SvgPicture.asset(Constants.getSvg("lock")),
          controller: bloc.confirmPassword,
          errorText: bloc.confirmPasswordError,
          hasError: !bloc.confirmPasswordValidation,
          hasValidationHint: true,
          validationHint: tr("bothPasswordMustMatch"),
          onChange: (value) {
            if (!bloc.confirmPasswordValidation) {
              bloc.confirmPasswordValidation = true;
            }
            bloc.add(Update());
          },
        ),
      ],
    );
  }
}
