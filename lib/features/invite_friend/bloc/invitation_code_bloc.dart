import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../models/invitation_code_model.dart';
import '../repo/invitation_code_repo.dart';

class InvitationCodeBloc extends Bloc<AppEvent, AppState> {
  InvitationCodeBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static InvitationCodeBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  InvitationCodeModel model = InvitationCodeModel();

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await InvitationCodeRepo.getInvitationCode();
      if(response.statusCode == 200) {
        model = InvitationCodeModel.fromJson(response.data);
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