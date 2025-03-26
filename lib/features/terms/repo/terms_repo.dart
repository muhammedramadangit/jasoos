import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class TermsRepo {
  static Future getTerms() async {
    return await Network().request(
      Endpoints.TERMS,
      method: ServerMethods.GET,
    );
  }
}
