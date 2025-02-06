import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/login/repo/login_repo.dart';
import 'package:jasoos/main_models/user_model.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
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
    phoneError = AppValidations.phone(phone.text);
    passwordError = AppValidations.password(password.text);
    phoneValidation = phoneError!.isEmpty;
    passwordValidation = passwordError!.isEmpty;
    return phoneValidation && passwordValidation;
  }

  clear() {
    phone.clear();
    password.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "phone" : phone.text,
        "phone_code" : countryCode ?? "+966",
        "password" : password.text,
      };
      try {
        Response response = await LoginRepo.login(body);
        if(response.statusCode == 200) {
          if(response.data["data"]["is_active"] == 0) {
            showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
            emit(Error());
          } if(response.data["data"]["is_verified"] == 0) {
            showCustomDialog(
              dismiss: false,
              dialog: CustomAlertDialog("Oops! Your account isn’t verified yet. Verify now to unlock full access!"),
            ).then(
              (value) {
                AppStorage.cacheToken(response.data["data"]["token"]);
                CustomNavigator.push(Routes.OTP, arguments: false);
              },
            );
            emit(Done());
          } else {
            AppStorage.cacheUser(UserModel.fromJson(response.data));
            AppStorage.cacheToken(response.data["data"]["token"]);
            CustomNavigator.push(Routes.MAIN_PAGES, clean: true);
            clear();
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
      emit(Start());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}