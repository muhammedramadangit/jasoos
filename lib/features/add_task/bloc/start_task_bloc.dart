import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_validation.dart';
import 'package:jasoos/features/add_task/bloc/questions_bloc.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../main_widgets/custom_toast.dart';
import '../../../navigation/routes.dart';
import '../repo/add_task_repo.dart';

class StartTaskBloc extends Bloc<AppEvent, AppState> {
  StartTaskBloc() : super(Initial()) {
    on<Update>(_update);
    on<Start>(_startTask);
    on<Click>(_submitAnswer);
  }
  static StartTaskBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  double? selectedRate = 0.0;
  String? selectedReview;
  int? taskSubmission;

  List<String> multiSelectedAnswer = [];
  File? fileAnswer;
  XFile? imageAnswer;
  XFile? videoAnswer;
  TextEditingController textAnswer = TextEditingController();
  bool textAnswerValidation = true;
  String? textAnswerError;

  resetData() {
    QuestionsBloc.instance.index = 0;
    selectedRate = 0.0;
    selectedReview = null;
    multiSelectedAnswer.clear();
    fileAnswer = null;
    imageAnswer = null;
    videoAnswer = null;
    textAnswer.clear();
    textAnswerValidation = true;
    textAnswerError = null;
    add(Update());
  }

  getRate() {
    if(selectedRate == 1.0) {
      selectedReview = "veryPoor";
    } else if (selectedRate == 2.0) {
      selectedReview = "poor";
    } else if (selectedRate == 3.0) {
      selectedReview = "good";
    } else if (selectedRate == 4.0) {
      selectedReview = "veryGood";
    } else if (selectedRate == 5.0) {
      selectedReview = "excellent";
    } else {
      selectedReview = "-";
    }
    add(Update());
  }

  checkValidation(Map<String, dynamic> arguments) {
    int type = arguments["question_type_id"];
    if(type == 1 && multiSelectedAnswer.isEmpty) {
      showCustomDialog(dialog: CustomAlertDialog(tr("pleaseSelectOption")));
    } else if (type == 2 && textAnswer.text.isEmpty) {
      textAnswerError = AppValidations.any(textAnswer.text);
      textAnswerValidation = textAnswerError!.isEmpty;
      add(Update());
    } else if (type == 3 && imageAnswer == null) {
      showCustomDialog(dialog: CustomAlertDialog(tr("pleaseSelectImage")));
    } else if (type == 4 && fileAnswer == null) {
      showCustomDialog(dialog: CustomAlertDialog(tr("pleaseSelectFile")));
    } else if (type == 5 && videoAnswer == null) {
      showCustomDialog(dialog: CustomAlertDialog(tr("pleaseSelectVideo")));
    } else if (type == 6 && selectedRate == 0.0) {
      showCustomDialog(dialog: CustomAlertDialog(tr("pleaseSelectRate")));
    } else {
      add(Click(arguments: arguments));
    }
  }

  _startTask(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddTaskRepo.startTask(event.arguments as int);
      if(response.statusCode == 200) {
        CustomNavigator.push(Routes.START_TASK);
        taskSubmission = response.data["data"]["task_submission_id"];
        QuestionsBloc.instance.add(Get(arguments: event.arguments as int));
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _submitAnswer(AppEvent event, Emitter<AppState> emit) async {
    Map<String, dynamic> arguments = event.arguments as Map<String, dynamic>;
    emit(Loading());
    try {
      Map<String, dynamic> body = {
        if(arguments["question_type_id"] == 1) // Multiselect
          "answer" : multiSelectedAnswer,
        if(arguments["question_type_id"] == 2) // text
          "answer" : textAnswer.text,
        if(arguments["question_type_id"] == 3) // image
          "answer" : await MultipartFile.fromFile(imageAnswer!.path),
        if(arguments["question_type_id"] == 4) // file
          "answer" : await MultipartFile.fromFile(fileAnswer!.path),
        if(arguments["question_type_id"] == 5) // video
          "answer" : await MultipartFile.fromFile(videoAnswer!.path),
        if(arguments["question_type_id"] == 6) // review
          "answer" : selectedRate.toString(),
      };
      Response response = await AddTaskRepo.submitAnswer(
        taskSubmission: taskSubmission,
        questionId: arguments["question_id"],
        body: body,
      );
      if(response.statusCode == 200) {
        if(QuestionsBloc.instance.index + 1 < QuestionsBloc.instance.model.data!.length){
          QuestionsBloc.instance.index++;
        } else {
          CustomNavigator.push(Routes.TASK_COMPLETE);
        }
        QuestionsBloc.instance.add(Update());
        emit(Done());
      } else {
        showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) => emit(Initial());
}