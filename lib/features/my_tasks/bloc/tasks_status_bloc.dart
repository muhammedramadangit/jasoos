import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/my_tasks/bloc/my_tasks_bloc.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../models/tasts_status_model.dart';
import '../repo/tasks_repo.dart';

class TasksStatusBloc extends Bloc<AppEvent, AppState> {
  TasksStatusBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static TasksStatusBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  TasksStatusModel model = TasksStatusModel();
  List<TaskStatusInfo> tasksStatusList = [];

  int? taskStatus = 0;

  onChangeTaskStatus(value) {
    taskStatus = value;
    MyTasksBloc.instance.add(Get(arguments: value));
    add(Update());
  }

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await TasksRepo.getMyTasksStatus();
      if(response.statusCode == 200) {
        model = TasksStatusModel.fromJson(response.data);
        tasksStatusList = [
          TaskStatusInfo(
            value: 0,
            name: "All tasks"
          ),
          ...?model.data,
        ];
        if(model.data!.isEmpty) {
          emit(Empty());
        } else {
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