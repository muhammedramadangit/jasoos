import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class InvitationCodeRepo {
  static Future getInvitationCode() async {
    return await Network().request(
      Endpoints.INVITATION_CODE,
      method: ServerMethods.GET,
    );
  }
}