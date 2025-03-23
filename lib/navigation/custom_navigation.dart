import 'package:flutter/material.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/add_task/bloc/start_task_bloc.dart';
import 'package:jasoos/features/bank_account/view/bank_account_view.dart';
import 'package:jasoos/features/change_password/view/change_password_view.dart';
import 'package:jasoos/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:jasoos/features/forget_password/view/forget_password_view.dart';
import 'package:jasoos/features/help/view/help_view.dart';
import 'package:jasoos/features/home/view/all_recent_tasks_view.dart';
import 'package:jasoos/features/id_information/view/id_information_view.dart';
import 'package:jasoos/features/invite_friend/view/invite_friend_view.dart';
import 'package:jasoos/features/language/view/language_view.dart';
import 'package:jasoos/features/login/bloc/login_bloc.dart';
import 'package:jasoos/features/login/view/login_view.dart';
import 'package:jasoos/features/notification_setting/view/notification_setting_view.dart';
import 'package:jasoos/features/onboarding/view/onboarding_view.dart';
import 'package:jasoos/features/otp/bloc/otp_bloc.dart';
import 'package:jasoos/features/otp/view/otp_view.dart';
import 'package:jasoos/features/policy/view/policy_view.dart';
import 'package:jasoos/features/profile/view/profile_view.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/features/register/view/register_view.dart';
import 'package:jasoos/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:jasoos/features/reset_password/view/reset_password_success_view.dart';
import 'package:jasoos/features/reset_password/view/reset_password_view.dart';
import 'package:jasoos/features/rewards/view/rewards_view.dart';
import 'package:jasoos/features/security_and_password/view/security_and_password_view.dart';
import 'package:jasoos/features/select_category/view/select_category_view.dart';
import 'package:jasoos/features/splash/view/splash_view.dart';
import 'package:jasoos/features/task_complete/view/task_complete_view.dart';
import 'package:jasoos/features/shop_details/bloc/shop_details_bloc.dart';
import 'package:jasoos/features/task_details/view/task_details_view.dart';
import 'package:jasoos/features/terms/view/terms_view.dart';
import 'package:jasoos/features/two_step_verification/view/two_step_verification.dart';
import 'package:jasoos/main_pages/view/main_pages_view.dart';
import 'package:jasoos/my_app.dart';
import 'package:jasoos/navigation/routes.dart';
import 'package:jasoos/no_internet.dart';

import '../features/add_task/bloc/questions_bloc.dart';
import '../features/add_task/view/add_task_view.dart';
import '../features/bank_account/bloc/bank_account_bloc.dart';
import '../features/id_information/bloc/id_information_bloc.dart';
import '../features/home/view/nearest_shops_view.dart';
import '../features/profile/bloc/profile_bloc.dart';
import '../features/shop_details/view/shop_details_view.dart';
import '../features/task_details/bloc/task_details_bloc.dart';

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
        LoginBloc.instance.add(Update());
        return pageRoute(LoginView());

      case Routes.REGISTER:
        RegisterBloc.instance.add(Update());
        return pageRoute(RegisterView());

      case Routes.OTP:
        OtpBloc.instance.code.clear();
        OtpBloc.instance.add(Update());
        return pageRoute(OtpView(isForget: settings.arguments as bool));

      case Routes.FORGET_PASSWORD:
        ForgetPasswordBloc.instance.add(Update());
        return pageRoute(ForgetPasswordView());

      case Routes.SELECT_CATEGORY:
        return pageRoute(SelectCategoryView());

      case Routes.RESET_PASSWORD:
        ResetPasswordBloc.instance.add(Update());
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
        ProfileBloc.instance.fillUserData();
        return pageRoute(ProfileView());

      case Routes.BANK_ACCOUNT:
        BankAccountBloc.instance.fillBankData();
        return pageRoute(BankAccountView());

      case Routes.ID_INFORMATION:
        IdInformationBloc.instance.fillData();
        return pageRoute(IdInformationView());

      case Routes.INVITE_FRIENDS:
        return pageRoute(InviteFriendView());

      case Routes.REWARDS:
        return pageRoute(RewardsView());

      case Routes.SHOP_DETAILS:
        ShopDetailsBloc.instance.add(Get(arguments: settings.arguments as int));
        return pageRoute(ShopDetailsView());

      case Routes.TASK_DETAILS:
        TaskDetailsBloc.instance.add(Get(arguments: settings.arguments as int));
        return pageRoute(TaskDetailsView());

      case Routes.START_TASK:
        StartTaskBloc.instance.resetData();
        QuestionsBloc.instance.selectedProblem.clear();
        return pageRoute(AddTaskView());

      case Routes.TASK_COMPLETE:
        return pageRoute(TaskComplete());

      case Routes.NEAREST_SHOPS:
        return pageRoute(NearestShopsView());

      case Routes.ALL_RECENT_TASKS:
        return pageRoute(AllRecentTasksView());

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
