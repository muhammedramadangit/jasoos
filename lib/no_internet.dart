import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/main_widgets/custom_button.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:lottie/lottie.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/internet.json"),
            SizedBox(height: 16.h),
            Text(
              tr("noInternet"),
              style: AppTextStyles.w500.copyWith(fontSize: 22),
            ),
            SizedBox(height: 32.h),
            CustomButton(
              text: tr("tryAgain"),
              width: 120.w,
              height: 45.h,
              onTap: () async {
                var check = await Connectivity().checkConnectivity();
                if(check.contains(ConnectivityResult.none) == false) {
                  CustomNavigator.pop();
                } else {
                  showToast(tr("checkInternet"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
