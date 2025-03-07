import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../models/shops_model.dart';
import '../repo/home_repo.dart';

class ShopsBloc extends Bloc<AppEvent, AppState> {
  ShopsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static ShopsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  ShopsModel model = ShopsModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await HomeRepo.getShops(isNearest: false);
      if(response.statusCode == 200) {
        model = ShopsModel.fromJson(response.data);
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