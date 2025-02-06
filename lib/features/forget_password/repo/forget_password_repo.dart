import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class ForgetPasswordRepo {
  static Future forgetPassword(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.FORGET_PASSWORD,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}