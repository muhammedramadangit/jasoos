import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class TaskDetailsRepo {
  static Future getTaskDetails(int id) async {
    return await Network().request(
      Endpoints.TASK_DETAILS(id),
      method: ServerMethods.GET,
    );
  }
}