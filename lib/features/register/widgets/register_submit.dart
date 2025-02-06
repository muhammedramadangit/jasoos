import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';

class RegisterSubmit extends StatelessWidget {
  const RegisterSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> social = [
      {
        "icon": "google",
        "name": "Continue With Google",
        "onTap": () {
          // SocialAuthHelper.loginWithGoogle.call().then((value) {
          //   SocialLoginBloc.instance.add(Click(arguments: {
          //     "email": value.email,
          //     "name": value.name,
          //     "source": "google",
          //   }));
          // });
        },
      },
      {
        "icon": "facebook",
        "name": "Continue With Facebook",
        "onTap": () {
          // SocialAuthHelper.loginWithFacebook.call().then((value) {
          //   log("FACEBOOK VALUEE ${value.email}");
          //   value.printData();
          //   // SocialLoginBloc.instance.add(Click(arguments: {
          //   //   "email": value.email,
          //   //   "name": value.name,
          //   //   "source": "facebook",
          //   // }));
          // });
        },
      },
      if(Platform.isAndroid)
        {
          "icon": "apple",
          "name": "Continue With Apple",
          "onTap": () {
            // SocialAuthHelper.loginWithApple.call().then((value) {
            //   // AuthCubit.get(NavigatorHelper.currentContext).socialLogin(socialId: value.id);
            // });
          },
        },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            children: [
              Expanded(child: Styles.divider()),
              SizedBox(width: 24.w),
              Text(
                "Or Sign up With Account",
                style: AppTextStyles.w400.copyWith(fontSize: 14),
              ),
              SizedBox(width: 24.w),
              Expanded(child: Styles.divider()),
            ],
          ),
          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: social.map((social) {
              return GestureDetector(
                onTap: () {
                  social["onTap"]();
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                  decoration: BoxDecoration(
                    color: Styles.FILL_COLOR,
                    border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Constants.getSvg(social["icon"]),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 24.h),

          BlocBuilder<RegisterBloc, AppState>(
            builder: (context, state) {
              return CustomButton(
                text: "Create account",
                loading: state is Loading,
                onTap: () {
                  RegisterBloc.instance.add(Click());
                },
              );
            },
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: AppTextStyles.w500.copyWith(
                  fontSize: 14,
                  color: Styles.GREY_TEXT_COLOR,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "Login",
                style: AppTextStyles.w700.copyWith(
                  fontSize: 14,
                  color: Styles.PRIMARY_COLOR,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
