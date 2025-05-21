import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/login/bloc/login_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> social = [
    //   {
    //     "icon": "google",
    //     "name": tr("continueWithGoogle"),
    //     "onTap": () {
    //       SocialAuthHelper.loginWithGoogle.call().then((value) {
    //         SocialLoginBloc.instance.add(Click(arguments: {
    //           "access_token": value.accessToken,
    //           "provider": "google",
    //         }));
    //       });
    //     },
    //   },
    //   {
    //     "icon": "facebook",
    //     "name": tr("continueWithFacebook"),
    //     "onTap": () {
    //       SocialAuthHelper.loginWithFacebook.call().then((value) {
    //         SocialLoginBloc.instance.add(Click(arguments: {
    //           "access_token": value.accessToken,
    //           "provider": "facebook",
    //         }));
    //       });
    //     },
    //   },
    //   if(Platform.isAndroid)
    //     {
    //       "icon": "apple",
    //       "name": tr("continueWithApple"),
    //       "onTap": () {
    //         SocialAuthHelper.loginWithApple.call().then((value) {
    //           SocialLoginBloc.instance.add(Click(arguments: {
    //             "access_token": value.accessToken,
    //             "provider": "apple",
    //           }));
    //         });
    //       },
    //     },
    // ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<LoginBloc, AppState>(
            builder: (context, state) {
              LoginBloc bloc = LoginBloc.instance;
              return CustomButton(
                text: tr("login"),
                disable: bloc.phone.text.isEmpty || bloc.password.text.isEmpty,
                loading: state is Loading,
                onTap: () {
                  bloc.add(Click());
                },
              );
            },
          ),

          // SizedBox(height: 24.h),
          // Row(
          //   children: [
          //     Expanded(child: Styles.divider()),
          //     SizedBox(width: 24.w),
          //     Text(
          //       "Or Login With Account",
          //       style: AppTextStyles.w400.copyWith(fontSize: 14),
          //     ),
          //     SizedBox(width: 24.w),
          //     Expanded(child: Styles.divider()),
          //   ],
          // ),
          // SizedBox(height: 24.h),
          //
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: social.map((social) {
          //     return GestureDetector(
          //       onTap: () {
          //         social["onTap"]();
          //       },
          //       child: Container(
          //         padding: EdgeInsets.symmetric(
          //             vertical: 14.h, horizontal: 53.w),
          //         margin: EdgeInsets.symmetric(vertical: 7.h),
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Styles.BORDER_COLOR, width: 0.5),
          //           borderRadius: BorderRadius.circular(100),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             SvgPicture.asset(
          //               Constants.getSvg(social["icon"]),
          //               height: 24,
          //               width: 24,
          //             ),
          //             SizedBox(width: 24.w),
          //             Text(
          //               social["name"],
          //               style: AppTextStyles.w400.copyWith(fontSize: 14),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr("doNotHaveAccount"),
                style: AppTextStyles.w500.copyWith(
                  fontSize: 14,
                  color: Styles.GREY_TEXT_COLOR,
                ),
              ),
              SizedBox(width: 6.w),
              InkWell(
                onTap: () {
                  CustomNavigator.push(Routes.REGISTER);
                },
                child: Text(
                  tr("register"),
                  style: AppTextStyles.w700.copyWith(
                    fontSize: 14,
                    color: Styles.PRIMARY_COLOR,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
