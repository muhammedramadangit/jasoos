import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:jasoos/features/language/bloc/language_bloc.dart';
import 'package:jasoos/features/login/bloc/login_bloc.dart';
import 'package:jasoos/features/otp/bloc/otp_bloc.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:jasoos/features/select_category/bloc/select_category_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../features/add_task/bloc/questions_bloc.dart';
import '../features/add_task/bloc/start_task_bloc.dart';
import '../features/home/bloc/current_location_bloc.dart';
import '../features/home/bloc/home_categories_bloc.dart';
import '../features/home/bloc/nearest_shop_bloc.dart';
import '../features/home/bloc/recent_tasks_bloc.dart';
import '../features/home/bloc/shops_bloc.dart';
import '../features/login/bloc/social_login.dart';
import '../features/my_tasks/bloc/completed_tasks_bloc.dart';
import '../features/my_tasks/bloc/ongoing_tasks_bloc.dart';
import '../features/shop_details/bloc/shop_details_bloc.dart';
import '../features/task_details/bloc/task_details_bloc.dart';

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    BlocProvider<SocialLoginBloc>(create: (_) => SocialLoginBloc()),
    BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
    BlocProvider<OtpBloc>(create: (_) => OtpBloc()),
    BlocProvider<SelectCategoryBloc>(create: (_) => SelectCategoryBloc()..add(Get())),
    BlocProvider<LoginBloc>(create: (_) => LoginBloc()..add(Check())),
    BlocProvider<ForgetPasswordBloc>(create: (_) => ForgetPasswordBloc()),
    BlocProvider<ResetPasswordBloc>(create: (_) => ResetPasswordBloc()),

    BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
    BlocProvider<BankAccountBloc>(create: (_) => BankAccountBloc()),
    BlocProvider<StartTaskBloc>(create: (_) => StartTaskBloc()),
    BlocProvider<OngoingTasksBloc>(create: (_) => OngoingTasksBloc()),
    BlocProvider<CompletedTasksBloc>(create: (_) => CompletedTasksBloc()),
    BlocProvider<RecentTasksBloc>(create: (_) => RecentTasksBloc()),
    BlocProvider<TaskDetailsBloc>(create: (_) => TaskDetailsBloc()),
    BlocProvider<QuestionsBloc>(create: (_) => QuestionsBloc()),

    BlocProvider<HomeCategoriesBloc>(create: (_) => HomeCategoriesBloc()),
    BlocProvider<ShopsBloc>(create: (_) => ShopsBloc()),
    BlocProvider<NearestShopsBloc>(create: (_) => NearestShopsBloc()),
    BlocProvider<ShopDetailsBloc>(create: (_) => ShopDetailsBloc()),
    BlocProvider<CurrentLocationBloc>(create: (_) => CurrentLocationBloc()),
  ];
}