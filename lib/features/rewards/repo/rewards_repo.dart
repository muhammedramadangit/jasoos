import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class RewardsRepo {
  static Future getRewards() async {
    return await Network().request(
      Endpoints.REWARDS,
      method: ServerMethods.GET,
    );
  }
}