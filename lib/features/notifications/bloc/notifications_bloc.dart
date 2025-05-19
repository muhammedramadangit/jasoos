import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/notifications/bloc/notification_count_bloc.dart';
import 'package:jasoos/features/notifications/model/notifications_model.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../repo/notifications_repo.dart';

class NotificationsBloc extends Bloc<AppEvent, AppState> {
  NotificationsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static NotificationsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  NotificationModel model = NotificationModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await NotificationsRepo.getNotifications();
      if(response.statusCode == 200) {
        model = NotificationModel.fromJson(response.data);
        if(model.data!.notifications!.isEmpty) {
          emit(Empty());
        } else {
          emit(Done());
        }
        NotificationsCountBloc.instance.add(GetCount());
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