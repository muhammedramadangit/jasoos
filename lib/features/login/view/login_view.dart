import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/login/bloc/login_bloc.dart';
import 'package:jasoos/features/login/widgets/login_form.dart';
import 'package:jasoos/features/login/widgets/login_submit.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/appbars/app_bars.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.authAppBar(back: false),
      body: BlocBuilder<LoginBloc, AppState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: AppTextStyles.w500.copyWith(fontSize: 28),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Sign In to your account",
                  style: AppTextStyles.w400.copyWith(
                    fontSize: 16,
                    color: Styles.GREY_TEXT_COLOR,
                  ),
                ),
                SizedBox(height: 32.h),
                LoginForm(),
                LoginSubmit(),
              ],
            ),
          );
        },
      ),
    );
  }
}