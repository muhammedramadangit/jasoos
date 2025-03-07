import 'package:dio/dio.dart';
import 'package:jasoos/app_config/end_points.dart';
import 'package:jasoos/network/network_layer.dart';

abstract class AddTaskRepo {
  static Future startTask(int id) async {
    return await Network().request(
      Endpoints.START_TASK(id),
      method: ServerMethods.GET,
    );
  }

  static Future getQuestions(int id) async {
    return await Network().request(
      Endpoints.TASK_QUESTIONS(id),
      method: ServerMethods.GET,
    );
  }

  static Future submitAnswer({int? taskSubmission, int? questionId, Map<String, dynamic>? body}) async {
    return await Network().request(
      Endpoints.SUBMIT_ANSWER(taskSubmission: taskSubmission, questionId: questionId),
      method: ServerMethods.POST,
      body: FormData.fromMap(body!),
    );
  }
}