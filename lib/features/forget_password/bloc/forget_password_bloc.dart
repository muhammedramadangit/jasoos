import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/forget_password/repo/forget_password_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class ForgetPasswordBloc extends Bloc<AppEvent, AppState> {
  ForgetPasswordBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static ForgetPasswordBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  TextEditingController phone = TextEditingController();
  bool phoneValidation = true;
  String? phoneError;
  String? countryCode;

  bool _validation(){
    phoneError = AppValidations.phone(phone.text);
    phoneValidation = phoneError!.isEmpty;
    return phoneValidation;
  }

  clear() {
    phone.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "phone" : phone.text,
        "phone_code" : countryCode ?? "+966",
      };
      try {
        Response response = await ForgetPasswordRepo.forgetPassword(body);
        if(response.statusCode == 200) {
          AppStorage.cachePhone(phone.text);
          AppStorage.cachePhoneCode(countryCode ?? "+966");
          CustomNavigator.push(Routes.OTP, arguments: true);
          emit(Done());
        } else {
          showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
          emit(Error());
        }
      } catch (e) {
        log("EXCEPTION $e");
        showToast(e.toString());
        emit(Error());
      }
    } else {
      emit(Start());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}