import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class RegisterRepo {
  static Future register(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.REGISTER,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}