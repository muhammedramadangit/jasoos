import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/core/app_storage.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class ShopDetailsRepo {
  static Future getShopDetails(int id) async {
    return await Network().request(
      Endpoints.SHOPS_DETAILS(id),
      method: ServerMethods.GET,
      query: {
        "lat" : AppStorage.getUserLat,
        "lng" : AppStorage.getUserLng,
      },
    );
  }
}