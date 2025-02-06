import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/register/repo/register_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static RegisterBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  TextEditingController name = TextEditingController();
  bool nameValidation = true;
  String? nameError;

  TextEditingController phone = TextEditingController();
  bool phoneValidation = true;
  String? phoneError;
  String? countryCode;

  TextEditingController email = TextEditingController();
  bool emailValidation = true;
  String? emailError;

  TextEditingController password = TextEditingController();
  bool passwordValidation = true;
  String? passwordError;

  bool _validation(){
    nameError = AppValidations.name(name.text);
    phoneError = AppValidations.phone(phone.text);
    emailError = AppValidations.email(email.text);
    passwordError = AppValidations.password(password.text);
    nameValidation = nameError!.isEmpty;
    phoneValidation = phoneError!.isEmpty;
    emailValidation = emailError!.isEmpty;
    passwordValidation = passwordError!.isEmpty;
    return nameValidation && phoneValidation && emailValidation && passwordValidation;
  }

  clear() {
    name.clear();
    phone.clear();
    email.clear();
    password.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "name" : name.text,
        "phone" : phone.text,
        "phone_code" : countryCode ?? "+966",
        "email" : email.text,
        "password" : password.text,
      };
      try {
        Response response = await RegisterRepo.register(body);
        if(response.statusCode == 201) {
          emit(Done());
          AppStorage.cachePhone(phone.text);
          AppStorage.cachePhoneCode(countryCode ?? "+966");
          CustomNavigator.push(Routes.OTP, arguments: false);
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