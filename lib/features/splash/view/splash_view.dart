import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:jasoos/core/app_storage.dart";
import "package:jasoos/helper/constants.dart";
import "package:jasoos/helper/styles.dart";
import "package:jasoos/navigation/custom_navigation.dart";
import "package:jasoos/navigation/routes.dart";

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      if(AppStorage.getOpenOnboarding == 0) {
        CustomNavigator.push(Routes.ONBOARDING, replace: true);
        AppStorage.cacheOpenOnboarding(1);
      } else {
        // CustomNavigator.push(AppStorage.isLogged ? Routes.MAIN_PAGES : Routes.LOGIN, replace: true);
        CustomNavigator.push(Routes.LOGIN, replace: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Styles.PRIMARY_COLOR,
        child: Center(
          child: Image.asset(
            Constants.getAsset("w-logo"),
            height: 80.h,
            width: 80.h,
          ),
        ),
      ),
    );
  }
}