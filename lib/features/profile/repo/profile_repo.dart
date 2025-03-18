import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class ProfileRepo {
  static Future getProfile() async {
    return await Network().request(
      Endpoints.PROFILE,
      method: ServerMethods.GET,
    );
  }

  static Future updateProfileImage(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.UPDATE_PROFILE_IMAGE,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }

  static Future updateProfile(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.UPDATE_PROFILE,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}