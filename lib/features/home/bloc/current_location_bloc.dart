import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jasoos/core/app_event.dart';
import 'package:jasoos/core/app_state.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/helper/permission_helper.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

class CurrentLocationBloc extends Bloc<AppEvent, AppState> {
  CurrentLocationBloc() : super(Loading()) {
    on<Update>(_update);
  }
  static CurrentLocationBloc get instance => BlocProvider.of(CustomNavigator.navigatorState.currentContext!);

  Timer? _timer;

  Future<void> startSendingLocation() async {
    // Request location permission
    // LocationPermission permission = await Geolocator.requestPermission();
    // if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
    //   // Handle permission denied error
    //   print("Location permission denied");
    //   // showCustomDialog(
    //   //   dialog: CustomDialog(
    //   //     msg: "Location permission required",
    //   //     actions: CustomButton(
    //   //       text: "settings",
    //   //       onTap: () {
    //   //         CustomNavigator.pop();
    //   //         // SystemSettings.location();
    //   //       },
    //   //     ),
    //   //   ),
    //   //   dismiss: true,
    //   // );
    //   return;
    // }

    PermissionHelper.checkLocationPermission();
    Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    AppStorage.cacheUserLat("${position.latitude}");
    AppStorage.cacheUserLng("${position.longitude}");

    // _timer = Timer.periodic(Duration(minutes: 2), (timer) async {
    //   Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    //   AppStorage.cacheUserLat("${position.latitude}");
    //   AppStorage.cacheUserLng("${position.longitude}");
    // });
  }

  void stopSendingLocation() {
    _timer?.cancel();
  }

  _update(AppEvent event, Emitter<AppState> emit) async {
    emit(Initial());
  }
}