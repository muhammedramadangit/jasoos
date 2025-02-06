import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/reset_password/repo/reset_password_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class ResetPasswordBloc extends Bloc<AppEvent, AppState> {
  ResetPasswordBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static ResetPasswordBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

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
    password.clear();
    confirmPassword.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "token" : AppStorage.getToken,
        "password" : password.text,
      };
      try {
        Response response = await ResetPasswordRepo.resetPassword(body);
        if(response.statusCode == 200) {
          CustomNavigator.push(Routes.RESET_PASSWORD_SUCCESS);
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
      emit(Start());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}