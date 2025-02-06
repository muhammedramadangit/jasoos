import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/otp/bloc/otp_bloc.dart';
import 'package:jasoos/features/otp/widgets/otp_count_down.dart';
import 'package:jasoos/features/otp/widgets/otp_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/fields/otp_text_field.dart';

class OtpView extends StatelessWidget {
  final bool? isForget;

  const OtpView({super.key, this.isForget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OtpBloc, AppState>(
        builder: (context, state) {
          OtpBloc bloc = OtpBloc.instance;
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 90.h),
                Text(
                  isForget == true
                      ? "Check your Phone"
                      : "Enter Verification Code",
                  style: AppTextStyles.w500.copyWith(fontSize: 28),
                ),
                SizedBox(height: 8.h),
                Text(
                  "We have sent a verify code to your Mobile Number",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 16,
                    color: Styles.GREY_TEXT_COLOR,
                  ),
                ),
                SizedBox(height: 60.h),
                OtpTextField(
                  controller: bloc.code,
                  errorText: bloc.codeError,
                  hasError: !bloc.codeValidation,
                  onChange: (value) {
                    if (!bloc.codeValidation) {
                      bloc.codeValidation = true;
                      bloc.add(Update());
                    }
                  },
                  onCompleted: (value) {
                    bloc.add(Click(arguments: isForget));
                  },
                ),
                SizedBox(height: 20.h),
                OtpSubmit(isForget: isForget),
                SizedBox(height: 40.h),
                OtpCountDown(),
              ],
            ),
          );
        },
      ),
    );
  }
}
