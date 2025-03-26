import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../model/terms_model.dart';
import '../repo/terms_repo.dart';

class TermsBloc extends Bloc<AppEvent, AppState> {
  TermsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static TermsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  TermsModel model = TermsModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await TermsRepo.getTerms();
      if(response.statusCode == 200) {
        model = TermsModel.fromJson(response.data);
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