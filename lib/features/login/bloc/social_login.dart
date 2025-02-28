import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/features/login/repo/login_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/main_widgets/dialogs/custom_alert_dialog.dart';
import 'package:jasoos/main_widgets/dialogs/custom_show_dialog.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../main_models/user_model.dart';

class SocialLoginBloc extends Bloc<AppEvent, AppState> {
  SocialLoginBloc() : super(Start()) {
    on<Update>(_update);
    on<Click>(_click);
  }
  static SocialLoginBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  _click(AppEvent event, Emitter<AppState> emit) async {
    Map<String, dynamic>? body = event.arguments as Map<String, dynamic>;
    emit(Loading());
    try {
      Response response = await LoginRepo.socialLogin(body);
      if(response.statusCode == 200) {
        AppStorage.cacheUser(UserModel.fromJson(response.data));
        AppStorage.cacheToken(response.data["data"]["token"]);
        CustomNavigator.push(Routes.MAIN_PAGES, clean: true);
        emit(Done());
      } else {
        showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
        emit(Error());
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}