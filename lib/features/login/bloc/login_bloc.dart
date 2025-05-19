import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/login/repo/login_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/constants.dart';
import '../../profile/bloc/profile_bloc.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Initial()) {
    on<Update>(_update);
    on<Click>(_click);
    on<Check>(_checkUserRemember);
  }
  static LoginBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  TextEditingController phone = TextEditingController();
  bool phoneValidation = true;
  String? phoneError;
  String? countryCode;

  TextEditingController password = TextEditingController();
  bool passwordValidation = true;
  String? passwordError;

  bool _validation(){
    phoneError = AppValidations.phone(phone.text.replaceAll("-", ""));
    passwordError = AppValidations.password(password.text);
    phoneValidation = phoneError!.isEmpty;
    passwordValidation = passwordError!.isEmpty;
    return phoneValidation && passwordValidation;
  }

  _checkUserRemember(AppEvent event, Emitter<AppState> emit) async {
    if(AppStorage.getRememberUser == true) {
      phone = TextEditingController(text: AppStorage.getUserPhone);
      password = TextEditingController(text: AppStorage.getUserPassword);
      emit(Initial());
    } else {
      phone.clear();
      password.clear();
      emit(Initial());
    }
    emit(Initial());
  }

  resetValidation() {
    phoneValidation = true;
    passwordValidation = true;
    add(Update());
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "phone" : phone.text.replaceAll("-", ""),
        "phone_code" : countryCode ?? "+966",
        "password" : password.text,
        "device_token" : Constants.device_id,
      };
      try {
        Response response = await LoginRepo.login(body);
        if(response.statusCode == 200) {
          AppStorage.cacheUserPhone(phone.text);
          AppStorage.cacheUserPassword(password.text);
          if(response.data["data"]["is_active"] == 0) {
            showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
            emit(Error());
          } if(response.data["data"]["is_verified"] == 0) {
            showCustomDialog(
              dismiss: false,
              dialog: CustomAlertDialog(tr("yourAccountNotVerified")),
            ).then(
              (value) {
                AppStorage.cacheToken(response.data["data"]["token"]);
                AppStorage.cachePhone(phone.text);
                AppStorage.cachePhoneCode(countryCode ?? "+966");
                CustomNavigator.push(Routes.OTP, arguments: false);
              },
            );
            emit(Done());
          } else {
            ProfileBloc.instance.add(Get());
            AppStorage.cacheToken(response.data["data"]["token"]);
            CustomNavigator.push(Routes.MAIN_PAGES, clean: true);
            add(Check());
            emit(Done());
          }
        } else {
          showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
          emit(Error());
        }
      } catch (e) {
        showToast(e.toString());
        emit(Error());
      }
    } else {
      emit(Initial());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async {
    emit(Initial());
  }
}