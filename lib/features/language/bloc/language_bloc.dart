import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class LanguageBloc extends Bloc<AppEvent, AppState> {
  LanguageBloc() : super(Start()) {
    on<Update>(_update);
    currentLangCode = CustomNavigator.navigatorState.currentContext!.locale.languageCode;
    selectedLangCode = currentLangCode == "ar" ? 0 : 1;
  }
  static LanguageBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  String? currentLangCode;
  int? selectedLangCode;

  List<Map<String, dynamic>> languages = [
    {
      "title": "العربية",
      "language": "ar",
      "icon": "sa",
    },
    {
      "title": "English",
      "language": "en",
      "icon": "en",
    },
  ];

  Future<void> changeLocaleLang() async {
    await CustomNavigator.navigatorState.currentContext!.setLocale(Locale(currentLangCode!)).then((value) {
      CustomNavigator.push(Routes.SPLASH);
    });
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}