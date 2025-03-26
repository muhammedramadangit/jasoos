import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class PolicyRepo {
  static Future getPolicy() async {
    return await Network().request(
      Endpoints.POLICY,
      method: ServerMethods.GET,
    );
  }
}
