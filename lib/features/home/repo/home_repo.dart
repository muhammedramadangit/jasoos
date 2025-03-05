import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class HomeRepo {
  static Future getShops({bool? isNearest}) async {
    return await Network().request(
      Endpoints.SHOPS,
      method: ServerMethods.GET,
      query: {
        "lat" : AppStorage.getUserLat,
        "lng" : AppStorage.getUserLng,
        if(isNearest == true)
          "sort_by_distance" : 1,
      },
    );
  }

  static Future getHomeCategories() async {
    return await Network().request(
      Endpoints.HOME_CATEGORIES,
      method: ServerMethods.GET,
    );
  }

  static Future getRecentTasks(Map<String, dynamic> query) async {
    return await Network().request(
      Endpoints.RECENT_TASKS,
      method: ServerMethods.GET,
      query: query
    );
  }
}