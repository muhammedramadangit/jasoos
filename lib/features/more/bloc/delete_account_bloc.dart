import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../app_config/end_points.dart';
import '../../../network/network_layer.dart';

class DeleteAccountBloc extends Bloc<AppEvent, AppState> {
  DeleteAccountBloc() : super(Initial()) {
    on<Update>(_update);
    on<Delete>(_delete);
  }
  static DeleteAccountBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  _delete(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await Network().request(
        Endpoints.DELETE_ACCOUNT,
        method: ServerMethods.GET,
      );
      if(response.statusCode == 200) {
        AppStorage.signOut();
        AppStorage.cacheRememberMe(false);
        emit(Done());
      } else {
        showToast(response.data["message"]);
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