import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:jasoos/features/bank_account/bloc/bank_account_bloc.dart';
import 'package:jasoos/features/language/bloc/language_bloc.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
    BlocProvider<BankAccountBloc>(create: (_) => BankAccountBloc()),
  ];
}