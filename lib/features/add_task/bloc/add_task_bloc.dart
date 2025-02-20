import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/add_task/widgets/review_task.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../navigation/routes.dart';
import '../widgets/problems_task.dart';
import '../widgets/task_done.dart';
import '../widgets/upload_image_task.dart';
import '../widgets/upload_receipt_task.dart';

class AddTaskBloc extends Bloc<AppEvent, AppState> {
  AddTaskBloc() : super(Start()) {
    on<Update>(_update);
  }
  static AddTaskBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  double? selectedRate = 0.0;
  String? selectedReview;
  int index = 0;
  int? selectedProblem;

  List<Widget> tasks = [
    ReviewTask(),
    UploadImageTask(),
    TaskDone(),
    ProblemsTask(),
    UploadReceiptTask(),
  ];

  onSelectProblem(value) {
    selectedProblem = value;
    add(Update());
  }

  resetData() {
    index = 0;
    selectedRate = 0.0;
    selectedReview = null;
    add(Update());
  }

  getRate() {
    if(selectedRate == 1.0) {
      selectedReview = "Very poor";
    } else if (selectedRate == 2.0) {
      selectedReview = "Poor";
    } else if (selectedRate == 3.0) {
      selectedReview = "Good";
    } else if (selectedRate == 4.0) {
      selectedReview = "Very good";
    } else if (selectedRate == 5.0) {
      selectedReview = "Excellent";
    } else {
      selectedReview = "-";
    }
    add(Update());
  }

  nextTask() {
    if(index + 1 < tasks.length){
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

  _update(AppEvent event, Emitter<AppState> emit) async {
    emit(Start());
  }
}