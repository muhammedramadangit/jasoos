import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/widgets/review_task.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../main_widgets/custom_toast.dart';
import '../../../main_widgets/dialogs/custom_show_dialog.dart';
import '../../../navigation/routes.dart';
import '../models/questions_model.dart';
import '../repo/add_task_repo.dart';
import '../widgets/multi_select_task.dart';
import '../widgets/text_task.dart';
import '../widgets/upload_image_task.dart';
import '../widgets/upload_file_task.dart';
import '../widgets/upload_video_task.dart';

class QuestionsBloc extends Bloc<AppEvent, AppState> {
  QuestionsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_getQuestion);
  }
  static QuestionsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  QuestionsModel model = QuestionsModel();
  List<bool> selectedProblem = [];
  int index = 0;

  List<Widget> tasks = [];

  Widget getTaskQuestionForType(QuestionInfo? model) {
    switch (model?.questionTypeId) {
      case 1:
        for(int i = 0; i < model!.options!.length; i++) {
          QuestionsBloc.instance.selectedProblem.add(false);
        }
        return MultiSelectTask(model: model); // multi select
      case 2:
        return TextTask(model: model); // note
      case 3:
        return UploadImageTask(model: model); // image
      case 4:
        return UploadFileTask(model: model); // file
      case 5:
        return UploadVideoTask(model: model); // video
      case 6:
        return ReviewTask(model: model); // review
      default:
        return SizedBox.shrink(); // Returns an empty widget if type is unknown
    }
  }

  onSelectProblem(value, index) {
    selectedProblem[index] = value;
    add(Update());
  }

  nextTask() {
    if(index + 1 < model.data!.length){
      index++;
    } else {
      CustomNavigator.push(Routes.TASK_COMPLETE);
    }
    add(Update());
  }

  previousTask() {
    if(index > 0) {
      index--;
    } else {
      CustomNavigator.pop();
    }
    add(Update());
  }

  _getQuestion(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddTaskRepo.getQuestions(event.arguments as int);
      if(response.statusCode == 200) {
        model = QuestionsModel.fromJson(response.data);
        if(model.data!.isEmpty) {
          CustomNavigator.pop();
          showCustomDialog(dialog: CustomAlertDialog(tr("noTasksYet")));
          emit(Empty());
        } else {
          tasks = model.data!.map((question) {
            return getTaskQuestionForType(question);
          }).toList();
          emit(Done());
        }
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async {
    emit(Initial());
  }
}