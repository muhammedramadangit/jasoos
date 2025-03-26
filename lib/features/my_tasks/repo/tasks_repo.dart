import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class TasksRepo {
  static Future getMyTasksStatus() async {
    return await Network().request(
      Endpoints.MY_TASKS_STATUS,
      method: ServerMethods.GET,
    );
  }

  static Future getMyTasks(Map<String, dynamic> query) async {
    return await Network().request(
      Endpoints.MY_TASKS,
      method: ServerMethods.GET,
      query: query
    );
  }
}
