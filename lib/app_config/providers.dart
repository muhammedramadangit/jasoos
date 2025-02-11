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

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
    BlocProvider<OtpBloc>(create: (_) => OtpBloc()),
    BlocProvider<SelectCategoryBloc>(create: (_) => SelectCategoryBloc()..add(Get())),
    BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
    BlocProvider<ForgetPasswordBloc>(create: (_) => ForgetPasswordBloc()),
    BlocProvider<ResetPasswordBloc>(create: (_) => ResetPasswordBloc()),

    BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
    BlocProvider<BankAccountBloc>(create: (_) => BankAccountBloc()),
  ];
}