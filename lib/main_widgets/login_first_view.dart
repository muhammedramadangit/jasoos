import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/constants.dart';
import 'package:jasoos/helper/media_quary_helper.dart';
import 'package:jasoos/helper/text_styles.dart';

class LoginFirstView extends StatelessWidget {
  final VoidCallback? onLogin;
  const LoginFirstView({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: MediaQueryHelper.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(Constants.getLottie("alert"), height: 200),
          SizedBox(height: 16.h),
          Text(
            tr("loginFirst"),
            textAlign: TextAlign.center,
            style: AppTextStyles.w600.copyWith(fontSize: 16),
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: tr("login"),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            onTap: () {
              AppStorage.signOut();
              // showCustomDialog(dialog: LoginDialog(onLogin: onLogin));
            },
          ),
        ],
      ),
    );
  }
}
