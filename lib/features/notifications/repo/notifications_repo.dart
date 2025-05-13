import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class NotificationsRepo {
  static Future getNotifications() async {
    return await Network().request(
      Endpoints.NOTIFICATIONS,
      method: ServerMethods.GET,
    );
  }

  static Future getNotificationsCount() async {
    return await Network().request(
      Endpoints.NOTIFICATIONS_COUNT,
      method: ServerMethods.GET,
    );
  }
}