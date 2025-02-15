import 'package:flutter/material.dart';
import 'package:jasoos/features/bank_account/view/bank_account_view.dart';
import 'package:jasoos/features/change_password/view/change_password_view.dart';
import 'package:jasoos/features/forget_password/view/forget_password_view.dart';
import 'package:jasoos/features/help/view/help_view.dart';
import 'package:jasoos/features/id_information/view/id_information_view.dart';
import 'package:jasoos/features/invite_friend/view/invite_friend_view.dart';
import 'package:jasoos/features/language/view/language_view.dart';
import 'package:jasoos/features/login/view/login_view.dart';
import 'package:jasoos/features/notification_setting/view/notification_setting_view.dart';
import 'package:jasoos/features/onboarding/view/onboarding_view.dart';
import 'package:jasoos/features/otp/view/otp_view.dart';
import 'package:jasoos/features/policy/view/policy_view.dart';
import 'package:jasoos/features/profile/view/profile_view.dart';
import 'package:jasoos/features/register/view/register_view.dart';
import 'package:jasoos/features/reset_password/view/reset_password_success_view.dart';
import 'package:jasoos/features/reset_password/view/reset_password_view.dart';
import 'package:jasoos/features/rewards/view/rewards_view.dart';
import 'package:jasoos/features/security_and_password/view/security_and_password_view.dart';
import 'package:jasoos/features/select_category/view/select_category_view.dart';
import 'package:jasoos/features/splash/view/splash_view.dart';
import 'package:jasoos/features/terms/view/terms_view.dart';
import 'package:jasoos/features/two_step_verification/view/two_step_verification.dart';
import 'package:jasoos/main_pages/view/main_pages_view.dart';
import 'package:jasoos/my_app.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:jasoos/no_internet.dart';

import '../features/my_task_details/view/my_task_details_view.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.bounceInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    PageRouteBuilder<dynamic> pageRoute(Widget widget) => PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

    switch (settings.name) {
      case Routes.APP:
        return pageRoute(MyApp());

      case Routes.NO_INTERNET:
        return pageRoute(NoInternetView());

      case Routes.SPLASH:
        return pageRoute(SplashView());

      case Routes.ONBOARDING:
        return pageRoute(OnboardingView());

      case Routes.LOGIN:
        return pageRoute(LoginView());

      case Routes.REGISTER:
        return pageRoute(RegisterView());

      case Routes.OTP:
        return pageRoute(OtpView(isForget: settings.arguments as bool));

      case Routes.FORGET_PASSWORD:
        return pageRoute(ForgetPasswordView());

      case Routes.SELECT_CATEGORY:
        return pageRoute(SelectCategoryView());

      case Routes.RESET_PASSWORD:
        return pageRoute(ResetPasswordView());

      case Routes.RESET_PASSWORD_SUCCESS:
        return pageRoute(ResetPasswordSuccessView());

      case Routes.MAIN_PAGES:
        return pageRoute(MainPagesView());

      case Routes.HELP:
        return pageRoute(HelpView());

      case Routes.TERMS:
        return pageRoute(TermsView());

      case Routes.POLICY:
        return pageRoute(PolicyView());

      case Routes.NOTIFICATION_SETTING:
        return pageRoute(NotificationSettingView());

      case Routes.SECURITY_AND_PASSWORD:
        return pageRoute(SecurityAndPassword());

      case Routes.TWO_STEP_VERIFICATION:
        return pageRoute(TwoStepVerification());

      case Routes.CHANGE_PASSWORD:
        return pageRoute(ChangePasswordView());

      case Routes.LANGUAGE:
        return pageRoute(LanguageView());

      case Routes.PROFILE:
        return pageRoute(ProfileView());

      case Routes.BANK_ACCOUNT:
        return pageRoute(BankAccountView());

      case Routes.ID_INFORMATION:
        return pageRoute(IdInformationView());

      case Routes.INVITE_FRIENDS:
        return pageRoute(InviteFriendView());

      case Routes.REWARDS:
        return pageRoute(RewardsView());

      case Routes.MY_TASK_DETAILS:
        return pageRoute(MyTaskDetailsView());

      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static Future<dynamic> push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
