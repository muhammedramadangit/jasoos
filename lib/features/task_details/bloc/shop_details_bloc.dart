import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/main_widgets/custom_toast.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

import '../../../core/app_storage.dart';
import '../models/shop_details_model.dart';
import '../repo/shop_details_repo.dart';

class ShopDetailsBloc extends Bloc<AppEvent, AppState> {
  ShopDetailsBloc() : super(Loading()) {
    on<Update>(_update);
    on<Get>(_get);
  }
  static ShopDetailsBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);
  ShopDetailsModel model = ShopDetailsModel();
  double distance = 0.0;

  _get(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ShopDetailsRepo.getShopDetails(event.arguments as int);
      if(response.statusCode == 200) {
        model = ShopDetailsModel.fromJson(response.data);
        distance = Geolocator.distanceBetween(double.parse(AppStorage.getUserLat), double.parse(AppStorage.getUserLng), double.parse("${model.data?.latitude}"), double.parse("${model.data?.longitude}"));
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
    emit(Start());
  }
}