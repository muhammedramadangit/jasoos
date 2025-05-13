import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../model/rewards_model.dart';
import '../repo/rewards_repo.dart';

class RewardsBloc extends Bloc<AppEvent, AppState> {
  RewardsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static RewardsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  RewardsModel model = RewardsModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await RewardsRepo.getRewards();
      if(response.statusCode == 200) {
        model = RewardsModel.fromJson(response.data);
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