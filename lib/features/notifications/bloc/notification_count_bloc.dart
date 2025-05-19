import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../repo/notifications_repo.dart';

class NotificationsCountBloc extends Bloc<AppEvent, AppState> {
  NotificationsCountBloc() : super(Loading()) {
    on<Update>(_update);
    on<GetCount>(_getCount);
  }
  static NotificationsCountBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  int? notificationCount = 0;

  _getCount(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await NotificationsRepo.getNotificationsCount();
      if(response.statusCode == 200) {
        notificationCount = response.data["data"]["notifications"] ?? 0;
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Initial());
}