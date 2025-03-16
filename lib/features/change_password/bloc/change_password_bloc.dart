import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../repo/change_password_repo.dart';

class ChangePasswordBloc extends Bloc<AppEvent, AppState> {
  ChangePasswordBloc() : super(Initial()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static ChangePasswordBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  TextEditingController oldPassword = TextEditingController();

  TextEditingController password = TextEditingController();
  bool passwordValidation = true;
  String? passwordError;

  TextEditingController confirmPassword = TextEditingController();
  bool confirmPasswordValidation = true;
  String? confirmPasswordError;

  bool _validation(){
    passwordError = AppValidations.password(password.text);
    passwordValidation = passwordError!.isEmpty;
    confirmPasswordError = AppValidations.confirmPassword(confirmPassword.text, password.text);
    confirmPasswordValidation = confirmPasswordError!.isEmpty;
    return passwordValidation && confirmPasswordValidation;
  }

  clear() {
    oldPassword.clear();
    password.clear();
    confirmPassword.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "old_password" : oldPassword.text,
        "new_password" : password.text,
        "new_password_confirmation" : confirmPassword.text,
      };
      try {
        Response response = await ChangePasswordRepo.changePassword(body);
        if(response.statusCode == 200) {
          showToast(response.data["message"], color: Styles.GREEN_COLOR);
          CustomNavigator.pop();
          clear();
          emit(Done());
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