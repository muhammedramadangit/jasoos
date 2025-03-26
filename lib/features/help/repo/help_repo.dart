import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class HelpRepo {
  static Future getFaqs() async {
    return await Network().request(
      Endpoints.HELP,
      method: ServerMethods.GET,
    );
  }
}
