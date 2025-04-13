import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_event.dart';
import '../../../helper/styles.dart';
import '../../../main_widgets/fields/text_input_field.dart';
import '../bloc/change_password_bloc.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc bloc = ChangePasswordBloc.instance;
    return Expanded(
      child: SingleChildScrollView(
        padding: Styles.SCREEN_PADDING,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            TextInputField(
              labelText: tr("enterYourCurrentPassword"),
              hintText: tr("enterYourCurrentPassword"),
              keyboardType: TextInputType.visiblePassword,
              controller: bloc.oldPassword,
            ),
            SizedBox(height: 8.h),
            TextInputField(
              labelText: tr("enterYourNewPassword"),
              hintText: tr("enterYourNewPassword"),
              keyboardType: TextInputType.visiblePassword,
              controller: bloc.password,
              errorText: bloc.passwordError,
              hasError: !bloc.passwordValidation,
              onChange: (value) {
                if (!bloc.passwordValidation) {
                  bloc.passwordValidation = true;
                }
                bloc.add(Update());
              },
            ),
            SizedBox(height: 8.h),
            TextInputField(
              labelText: tr("confirmYourNewPassword"),
              hintText: tr("confirmYourNewPassword"),
              keyboardType: TextInputType.visiblePassword,
              controller: bloc.confirmPassword,
              errorText: bloc.confirmPasswordError,
              hasError: !bloc.confirmPasswordValidation,
              onChange: (value) {
                if (!bloc.confirmPasswordValidation) {
                  bloc.confirmPasswordValidation = true;
                }
                bloc.add(Update());
              },
            ),
          ],
        ),
      ),
    );
  }
}
