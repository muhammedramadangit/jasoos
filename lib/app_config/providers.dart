import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    // BlocProvider<OnboardingBloc>(create: (_) => OnboardingBloc()),
  ];
}