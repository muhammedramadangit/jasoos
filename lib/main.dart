import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  // await NotificationHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(375, 812),
      builder: (context, child) {
        return EasyLocalization(
          useOnlyLangCode: true,
          saveLocale: true,
          supportedLocales: [Locale('en'), Locale('ar')],
          fallbackLocale: Locale('ar'),
           startLocale: Locale('ar'),
          path: 'assets/translations',
          child: MyApp(),
        );
      },
    ),
  );
}