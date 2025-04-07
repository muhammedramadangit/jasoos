import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/home/bloc/shops_bloc.dart';
import 'package:jasoos/features/home/models/home_categories_model.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../repo/home_repo.dart';
import 'nearest_shop_bloc.dart';

class HomeCategoriesBloc extends Bloc<AppEvent, AppState> {
  HomeCategoriesBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static HomeCategoriesBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  HomeCategoriesModel model = HomeCategoriesModel();

  int? selectedTaskType;
  List<HomeCategoryInfo>? taskTypes = [];

  onChangeTaskType(int? id) {
    selectedTaskType = id;
    NearestShopsBloc.instance.add(Get());
    ShopsBloc.instance.add(Get());
    add(Update());
  }

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    taskTypes = [];
    try {
      Response response = await HomeRepo.getHomeCategories();
      if(response.statusCode == 200) {
        model = HomeCategoriesModel.fromJson(response.data);
        taskTypes = [
          HomeCategoryInfo(
            id: 0,
            name: "All tasks"
          ),
          ...?model.data,
        ];
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