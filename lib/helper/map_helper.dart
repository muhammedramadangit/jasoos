import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jasoos/core/app_storage.dart';

import '../navigation/custom_navigation.dart';


class MapHelper {
  static MapHelper? instance;
  static AppStorage? preference;
  static Position? currentLocation;

  MapHelper._initial();

  factory MapHelper() {
    if (instance == null) {
      instance = MapHelper._initial();
      preference = AppStorage();
    } else {
      log("LOCATION IS NOT NULL AND HAS VALUE");
    }
    return instance!;
  }


  getCurrentLocation()async{
    if(await checkLocation())
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  checkLocation({bool isSplash = true}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      showCustomDialog(isSplash: isSplash);
      Future.error('Location services are disabled.');
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        await showCustomDialog(isSplash: isSplash);
        Future.error('Location permissions are denied');
        return false;

      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      permission = await Geolocator.requestPermission();
      await showCustomDialog(isSplash: isSplash);
      Future.error('Location permissions are permanently denied, we cannot request permissions.');
      return false;

    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true ;
  }

  showCustomDialog({bool isSplash = true}) {
    showDialog(
        context: CustomNavigator.navigatorState.currentContext!,
        builder: (_) => CupertinoAlertDialog(
          title: const Text("Location permission denied, please allow your location permission for Wannes ."),
          actions: [
            CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () async {
                  CustomNavigator.pop();
                  AppSettings.openAppSettings(asAnotherTask: true, type: AppSettingsType.location);
                }),
            CupertinoDialogAction(
                child: const Text("Cancel"),
                onPressed: () async {
                  CustomNavigator.pop();
                  // SplashBloc.instance.add(Click());
                }),
          ],
        ));
  }

  getLocation({bool isSplash = true}) async {
    // double lat = await preference!.readDouble(CachingKey.USER_LAT);
    // double long = await preference!.readDouble(CachingKey.USER_LONG);
    try {
      if (currentLocation == null) {
        log("Step 1");
        currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      } else {
        log("Step 2");
        log("LOCATION IS NOT NULL AND HAS VALUE is mocked: ${currentLocation!.isMocked}");
      }
      print("<<<<<<<<<<<<<<<< Get Current Location  >>>>>>>>>>>>>>>>>");
      // preference!.writeData(CachingKey.CHECK_LOCATION, true);
      // preference!.writeData(CachingKey.USER_LAT, currentLocation!.latitude);
      // preference!.writeData(CachingKey.USER_LONG, currentLocation!.longitude);
      String address = await formatLatLng(latLng : LatLng(currentLocation!.latitude ,currentLocation!.longitude));

      // preference!.writeData(CachingKey.ADDRESS, address);
      // bool isLogin = await preference!.readBoolean(CachingKey.IS_LOGIN);
      // if (isLogin) {
      //   UserBloc.instance.add(Update());
      // }
      print(r"<<<<<<<<<<<<<<<< Current Location Data $lat  $long  >>>>>>>>>>>>>>>>>");
    } catch (e) {
      print("<<<<<<<<<<<<<<<< Exception For Location ${e.toString()} >>>>>>>>>>>>>>>>>");
    }
  }


  static Future<String> formatLatLng({required LatLng latLng, bool getArea = false}) async {
    log(latLng.latitude.toString() + "/" + latLng.longitude.toString());
    List<Placemark> placeMarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placeMarks[0];
    List<String> address = [];
    try {
      // ignore: unused_local_variable
      if (getArea)
        return place.locality!;
      else {
        if (place.locality != "") {
          address.add(place.locality!);
        }
        address.add(place.subAdministrativeArea!);
        address.add(place.administrativeArea!);
        return "${place.name} ${address.toSet().join(",")}";
      }
    } on FormatException {
      address.add(place.name!);
      if (place.locality != "") {
        address.add(place.locality!);
      }

      address.add(place.subAdministrativeArea!);
      address.add(place.administrativeArea!);
      return address.toSet().join(",");
    }
  }


}