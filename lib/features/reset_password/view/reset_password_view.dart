import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:jasoos/features/reset_password/widgets/reset_password_form.dart';
import 'package:jasoos/features/reset_password/widgets/reset_password_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.authAppBar(),
      body: BlocBuilder<ResetPasswordBloc, AppState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create new password",
                          style: AppTextStyles.w500.copyWith(fontSize: 28),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Set your new password so you can login and access Jobs que",
                          style: AppTextStyles.w400.copyWith(
                            fontSize: 16,
                            color: Styles.GREY_TEXT_COLOR,
                          ),
                        ),
                        SizedBox(height: 44.h),
                        ResetPasswordForm(),
                      ],
                    ),
                  ),
                ),
                ResetPasswordSubmit(),
              ],
            ),
          );
        },
      ),
    );
  }
}
