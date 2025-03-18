import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../core/app_storage.dart';
import '../../../helper/styles.dart';
import '../../../main_widgets/dialogs/custom_alert_dialog.dart';
import '../../../main_widgets/dialogs/custom_show_dialog.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../repo/id_information_repo.dart';

class IdInformationBloc extends Bloc<AppEvent, AppState> {
  IdInformationBloc() : super(Loading()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static IdInformationBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  File? idImage;
  int? sizeInBytes;

  TextEditingController idController = TextEditingController();
  bool idValidation = true;
  String? idError;

  fillData() {
    idController = TextEditingController(text: AppStorage.getUser?.data?.idNumber ?? "");
    add(Update());
  }

  bool _validation(){
    idError = AppValidations.any(idController.text);
    idValidation = idError!.isEmpty;
    return idValidation;
  }

  clear() {
    idController.clear();
    add(Update());
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "id_number" : idController.text,
        if(idImage != null)
          "id_image" : await MultipartFile.fromFile(idImage!.path),
      };
      try {
        Response response = await IdInformationRepo.updateIdInfo(body);
        if(response.statusCode == 200) {
          showToast(response.data["message"], color: Styles.GREEN_COLOR);
          ProfileBloc.instance.add(Get());
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