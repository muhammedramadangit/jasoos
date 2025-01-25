import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:jasoos/helper/constants.dart";
import "package:jasoos/helper/styles.dart";

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Timer(Duration(seconds: 3), () {
    //   if(AppStorage.getOpenOnboarding == 0) {
    //     CustomNavigator.push(Routes.ONBOARDING, replace: true);
    //     AppStorage.cacheOpenOnboarding(1);
    //   } else {
    //     CustomNavigator.push(AppStorage.isLogged ? Routes.MAIN_PAGES : Routes.LOGIN, replace: true);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Styles.WHITE_COLOR,
        child: Center(
          child: Image.asset(
            Constants.getAsset("logo-blue"),
            height: 200.h,
            width: 200.h,
          ),
        ),
      ),
    );
  }
}