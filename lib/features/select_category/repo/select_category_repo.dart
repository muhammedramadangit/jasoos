import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class SelectCategoryRepo {
  static Future getCategories() async {
    return await Network().request(
      Endpoints.CATEGORIES,
      method: ServerMethods.GET,
    );
  }

  static Future selectCategories(Map<String, dynamic> body) async {
    return await Network().request(
      Endpoints.SELECT_CATEGORIES,
      method: ServerMethods.POST,
      body: FormData.fromMap(body),
    );
  }
}