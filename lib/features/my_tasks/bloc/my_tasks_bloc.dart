import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/my_tasks/models/tasks_model.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../repo/tasks_repo.dart';

class MyTasksBloc extends Bloc<AppEvent, AppState> {
  MyTasksBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static MyTasksBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  TasksModel model = TasksModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    int taskStatus = event.arguments != null ? event.arguments as int : 0;
    emit(Loading());
    try {
      Map<String, dynamic> query = {
        "lat" : AppStorage.getUserLat,
        "lng" : AppStorage.getUserLng,
        if(taskStatus != 0)
          "status" : taskStatus,
      };
      Response response = await TasksRepo.getMyTasks(query);
      if(response.statusCode == 200) {
        model = TasksModel.fromJson(response.data);
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