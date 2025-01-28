import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jasoos/helper/precache_helper.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:jasoos/network/network_layer.dart';
import 'package:jasoos/utiltiy/unfocus.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // NotificationHelper.onInit();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PrecacheHelper.preCacheHelper(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Network.lang = context.locale.languageCode;
    log("Accept-Language ::: ${Network.lang}");
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    //providers: ProviderList.providers,
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: UnFocus(child: child ?? Container()),
      ),
      initialRoute: Routes.SPLASH,
      // initialRoute: Routes.LOGIN,
      navigatorKey: CustomNavigator.navigatorState,
      onGenerateRoute: CustomNavigator.onCreateRoute,
      navigatorObservers: [
        CustomNavigator.routeObserver,
      ],
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: CustomNavigator.scaffoldState,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "Hi NET ERP",
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        snackBarTheme: SnackBarThemeData(contentTextStyle: TextStyle(fontFamily: "SpaceGrotesk-Medium")),
        primaryColor: Styles.PRIMARY_COLOR,
        colorScheme: ColorScheme.light(
          primary: Styles.PRIMARY_COLOR,
          secondary: Styles.ACCENT_COLOR,
        ),
        checkboxTheme: CheckboxThemeData(
          overlayColor: WidgetStateProperty.all<Color>(
            Styles.PRIMARY_COLOR.withOpacity(0.1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        fontFamily: 'SpaceGrotesk-Medium',
        scaffoldBackgroundColor: Styles.SCAFFOLD_COLOR,
      ),
    );
  }
}
