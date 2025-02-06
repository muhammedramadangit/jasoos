import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class OtpRepo {
  static Future verify(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.OTP,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}