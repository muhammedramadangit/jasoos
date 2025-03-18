import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class IdInformationRepo {
  static Future updateIdInfo(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.UPDATE_PROFILE_ID,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}