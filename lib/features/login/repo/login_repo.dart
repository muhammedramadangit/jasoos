import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class LoginRepo {
  static Future login(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.LOGIN,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}