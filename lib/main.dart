import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/my_app.dart';

import 'helper/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();

  // try {
  //   await NotificationHelper.init();
  // } catch (e) {
  //   // Ignore duplicate-app error
  //   if (e.toString().contains('already exists')) {
  //     log("ALREADY EXISTS ........................ ");
  //     try{
  //       Constants.device_id = await FirebaseMessaging.instance.getToken();
  //       print("FCM token :::: ${Constants.device_id}");
  //     }catch(e){
  //       print("FCM token Exception :: $e");
  //     }
  //   } else {
  //     rethrow;
  //   }
  // }


  await AppStorage.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      saveLocale: true,
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      path: 'assets/translations',
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(375, 812),
        builder: (context, child) {
          return MyApp();
        },
      ),
    ),
  );
}
