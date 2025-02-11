import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/forget_password/bloc/forget_password_bloc.dart';
import 'package:jasoos/features/otp/repo/otp_repo.dart';
import 'package:jasoos/features/register/bloc/register_bloc.dart';
import 'package:jasoos/features/select_category/bloc/select_category_bloc.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

class OtpBloc extends Bloc<AppEvent, AppState> {
  OtpBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static OtpBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  TextEditingController code = TextEditingController();
  bool codeValidation = true;
  String? codeError;

  bool _validation(){
    codeError = AppValidations.code(code.text);
    codeValidation = codeError!.isEmpty;
    return codeValidation;
  }

  clear() {
    code.clear();
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    bool isForget = event.arguments as bool;
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "phone" : AppStorage.getPhone,
        "phone_code" : AppStorage.getPhoneCode,
        "otp" : code.text,
      };
      try {
        Response response = await OtpRepo.verify(body);
        if(response.statusCode == 200) {
          AppStorage.cacheToken(response.data["data"]["token"]);
          if(isForget == true) {
            CustomNavigator.push(Routes.RESET_PASSWORD);
          } else {
            SelectCategoryBloc.instance.categories = [];
            SelectCategoryBloc.instance.add(Get());
            CustomNavigator.push(Routes.SELECT_CATEGORY, clean: true);
          }
          emit(Done());
          RegisterBloc.instance.clear();
          ForgetPasswordBloc.instance.clear();
          clear();
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