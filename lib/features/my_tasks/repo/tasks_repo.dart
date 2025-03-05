import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class TasksRepo {
  static Future getOngoingTasks() async {
    return await Network().request(
      Endpoints.GOING_TASKS,
      method: ServerMethods.GET,
    );
  }

  static Future getCompletedTasks() async {
    return await Network().request(
      Endpoints.COMPLETED_TASKS,
      method: ServerMethods.GET,
    );
  }

  static Future getAddedNewTasks() async {
    return await Network().request(
      Endpoints.COMPLETED_TASKS,
      method: ServerMethods.GET,
    );
  }
}
