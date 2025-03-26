import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../model/policy_model.dart';
import '../repo/policy_repo.dart';

class PolicyBloc extends Bloc<AppEvent, AppState> {
  PolicyBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static PolicyBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  PolicyModel model = PolicyModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await PolicyRepo.getPolicy();
      if(response.statusCode == 200) {
        model = PolicyModel.fromJson(response.data);
        emit(Done());
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