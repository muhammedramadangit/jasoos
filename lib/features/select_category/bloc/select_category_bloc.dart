import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/select_category/model/categories_model.dart';
import 'package:jasoos/features/select_category/repo/select_category_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/navigation/routes.dart';

import '../../../helper/styles.dart';
import '../../../main_widgets/dialogs/custom_alert_dialog.dart';
import '../../../main_widgets/dialogs/custom_show_dialog.dart';

class SelectCategoryBloc extends Bloc<AppEvent, AppState> {
  SelectCategoryBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
    on<Click>(_click);
  }
  static SelectCategoryBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  CategoriesModel model = CategoriesModel();
  List<int> categories = [];

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await SelectCategoryRepo.getCategories();
      if(response.statusCode == 200) {
        model = CategoriesModel.fromJson(response.data);
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _click(AppEvent event, Emitter<AppState> emit) async {
    emit(LoadingBTN());
    Map<String, dynamic> body = {};
    for (int i = 0; i < categories.length; i++) {
      body.addAll({
        "categories[$i]": categories[i],
      });
    }
    try {
      Response response = await SelectCategoryRepo.selectCategories(body);
      if(response.statusCode == 200) {
        CustomNavigator.push(Routes.LOGIN, clean: true);
        showToast(response.data["message"], color: Styles.GREEN_COLOR);
        emit(Done());
      } else {
        showCustomDialog(dialog: CustomAlertDialog(response.data["message"]));
        emit(ErrorBTN(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(ErrorBTN());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}