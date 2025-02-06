import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/features/select_category/repo/select_category_repo.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class SelectCategoryBloc extends Bloc<AppEvent, AppState> {
  SelectCategoryBloc() : super(Start()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static SelectCategoryBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await SelectCategoryRepo.getCategories();
      if(response.statusCode == 200) {
        emit(Done());
      } else {
        emit(Error(error: response.data["message"]));
      }
    } catch (e) {
      showToast(e.toString());
      emit(Error());
    }
  }

  _update(AppEvent event, Emitter<AppState> emit) async => emit(Start());
}