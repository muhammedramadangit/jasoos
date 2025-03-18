import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/profile/bloc/profile_bloc.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../core/app_validation.dart';
import '../../../helper/styles.dart';
import '../../../main_widgets/custom_toast.dart';
import '../../../main_widgets/dialogs/custom_alert_dialog.dart';
import '../../../main_widgets/dialogs/custom_show_dialog.dart';
import '../repo/bank_account_repo.dart';

class BankAccountBloc extends Bloc<AppEvent, AppState> {
  BankAccountBloc() : super(Initial()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static BankAccountBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  bool canEdit = false;

  TextEditingController bankName = TextEditingController();
  bool bankNameValidation = true;
  String? bankNameError;

  TextEditingController holderName = TextEditingController();
  bool holderNameValidation = true;
  String? holderNameError;

  TextEditingController iban = TextEditingController();
  bool ibanValidation = true;
  String? ibanError;

  fillBankData() {
    bankName = TextEditingController(text: AppStorage.getUser?.data?.bankAccount?.bankName ?? "");
    holderName = TextEditingController(text: AppStorage.getUser?.data?.bankAccount?.holderName ?? "");
    iban = TextEditingController(text: AppStorage.getUser?.data?.bankAccount?.iban ?? "");
    add(Update());
  }

  bool _validation(){
    bankNameError = AppValidations.name(bankName.text);
    bankNameValidation = bankNameError!.isEmpty;
    holderNameError = AppValidations.name(holderName.text);
    holderNameValidation = holderNameError!.isEmpty;
    ibanError = AppValidations.any(iban.text);
    ibanValidation = ibanError!.isEmpty;
    return bankNameValidation && holderNameValidation && ibanValidation;
  }

  clear() {
    bankName.clear();
    holderName.clear();
    iban.clear();
  }

  changeEditStatus() {
    canEdit = !canEdit;
    add(Update());
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    if(_validation()){
      Map<String, dynamic> body = {
        "bank_name" : bankName.text,
        "holder_name" : holderName.text,
        "iban" : iban.text,
      };
      try {
        Response response = await BankAccountRepo.changeBankAccount(body);
        if(response.statusCode == 200) {
          showToast(response.data["message"], color: Styles.GREEN_COLOR);
          ProfileBloc.instance.add(Get());
          changeEditStatus();
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

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Initial());
}