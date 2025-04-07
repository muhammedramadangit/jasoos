import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/main_models/select_option.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/utiltiy/date_formatter.dart';

import '../../../core/app_storage.dart';
import '../../../helper/styles.dart';
import '../../../main_models/user_model.dart';
import '../../../main_widgets/dialogs/custom_alert_dialog.dart';
import '../../../main_widgets/dialogs/custom_show_dialog.dart';
import '../repo/profile_repo.dart';

class ProfileBloc extends Bloc<AppEvent, AppState> {
  ProfileBloc() : super(Initial()) {
    on<Update>(_update);
    on<Get>(_get);
    on<Click>(_click);
    on<PickImage>(_updateImage);
  }
  static ProfileBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  UserModel model = UserModel();

  int profileDataCount = 0;
  int profileNullCount = 0;

  int profileBankDataCount = 0;
  int profileBankNullCount = 0;

  File? profileImage;

  TextEditingController name = TextEditingController();
  bool nameValidation = true;
  String? nameError;

  TextEditingController email = TextEditingController();
  bool emailValidation = true;
  String? emailError;

  TextEditingController phone = TextEditingController();
  String? phoneCode;
  bool phoneValidation = true;
  String? phoneError;

  DateTime? birthday;
  bool birthdayValidation = true;
  String? birthdayError;

  SelectOption? gender;
  bool genderValidation = true;
  String? genderError;

  SelectOption? maritalStatus;
  bool maritalStatusValidation = true;
  String? maritalStatusError;

  fillUserData() {
    name = TextEditingController(text: AppStorage.getUser?.data?.name ?? "");
    email = TextEditingController(text: AppStorage.getUser?.data?.email ?? "");
    phone = TextEditingController(text: AppStorage.getUser?.data?.phone ?? "");
    phoneCode = AppStorage.getUser?.data?.phoneCode ?? "+966";
    birthday = AppStorage.getUser?.data?.dateOfBirth != null ? DateTime.parse(AppStorage.getUser?.data?.dateOfBirth ?? "") : null;
    gender = SelectOption("${AppStorage.getUser?.data?.gender}", "${AppStorage.getUser?.data?.gender}");
    maritalStatus = SelectOption("${AppStorage.getUser?.data?.maritalStatus}", "${AppStorage.getUser?.data?.maritalStatus}");
    add(Update());
  }

  bool _validation(){
    nameError = AppValidations.name(name.text);
    emailError = AppValidations.email(email.text);
    phoneError = AppValidations.phone(phone.text.replaceAll("-", ""));
    // birthdayError = AppValidations.birthday(birthday != null ? birthday?.toYearMonthDayFormat() : "");
    genderError = AppValidations.gender(gender?.value);
    maritalStatusError = AppValidations.any(maritalStatus?.value);
    nameValidation = nameError!.isEmpty;
    emailValidation = emailError!.isEmpty;
    phoneValidation = phoneError!.isEmpty;
    // birthdayValidation = birthdayError!.isEmpty;
    genderValidation = genderError!.isEmpty;
    maritalStatusValidation = maritalStatusError!.isEmpty;
    bool? validation = nameValidation && emailValidation && phoneValidation && genderValidation && maritalStatusValidation;
    return validation;
  }

  clear() {
    name.clear();
    email.clear();
    phone.clear();
    birthday = null;
    gender = null;
    maritalStatus = null;
    add(Update());
  }

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ProfileRepo.getProfile();
      if(response.statusCode == 200) {
        model = UserModel.fromJson(response.data);
        AppStorage.cacheUser(model);
        profileNullCount = model.data!.checkNullMainKeys().values.where((value) => value == null).length;
        profileDataCount = model.data!.checkNullMainKeys().values.length;
        profileBankNullCount = model.data!.bankAccount == null ? 3 : model.data!.bankAccount!.checkNullBankAccount().values.where((value) => value == null).length;
        profileBankDataCount = model.data!.bankAccount == null ? 3 : model.data!.bankAccount!.checkNullBankAccount().values.length;
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _updateImage(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Map<String, dynamic> body = {
        "image" : await MultipartFile.fromFile(profileImage!.path),
      };
      Response response = await ProfileRepo.updateProfileImage(body);
      if(response.statusCode == 200) {
        showToast(response.data["message"], color: Styles.GREEN_COLOR);
        add(Get());
        profileImage = null;
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        if (name.text.isNotEmpty)
          "name": name.text,
        if (email.text.isNotEmpty)
          "email": email.text,
        if (phoneCode != null)
          "phone_code": phoneCode,
        if (phone.text.isNotEmpty)
          "phone": phone.text.replaceAll("-", ""),
        if (maritalStatus?.value != "null")
          "marital_status": maritalStatus?.value,
        if (gender?.value != "null")
          "gender": gender?.value,
        if (birthday != null)
          "date_of_birth" : birthday?.toYearMonthDayFormat(),
      };
      try {
        Response response = await ProfileRepo.updateProfile(body);
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