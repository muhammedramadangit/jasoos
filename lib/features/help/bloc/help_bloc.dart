import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../model/help_model.dart';
import '../repo/help_repo.dart';

class HelpBloc extends Bloc<AppEvent, AppState> {
  HelpBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static HelpBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  HelpModel model = HelpModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await HelpRepo.getFaqs();
      if(response.statusCode == 200) {
        model = HelpModel.fromJson(response.data);
        if(model.data!.faqs!.isEmpty) {
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