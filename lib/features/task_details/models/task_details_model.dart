class TasksDetailsModel {
  TaskDetailsInfo? data;
  String? message;
  int? statusCode;

  TasksDetailsModel({this.data, this.message, this.statusCode});

  TasksDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new TaskDetailsInfo.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class TaskDetailsInfo {
  int? id;
  String? name;
  String? description;
  String? taskType;
  String? shop;
  String? branch;
  String? shopImage;
  int? status;
  int? answeredQuestions;
  int? totalQuestions;
  String? startTime;
  String? finishTime;
  String? latitude;
  String? longitude;

  TaskDetailsInfo(
      {this.id,
        this.name,
        this.description,
        this.taskType,
        this.shop,
        this.branch,
        this.shopImage,
        this.status,
        this.answeredQuestions,
        this.totalQuestions,
        this.startTime,
        this.finishTime,
        this.latitude,
        this.longitude,
      });

  TaskDetailsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    taskType = json['task_type'];
    shop = json['shop'];
    branch = json['branch'];
    shopImage = json['shop_image'];
    status = json['status'];
    answeredQuestions = json['answered_questions'];
    totalQuestions = json['total_questions'];
    startTime = json['start_time'];
    finishTime = json['finish_time'];
    latitude = json['latitude'] ?? "0.0";
    longitude = json['longitude'] ?? "0.0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['task_type'] = this.taskType;
    data['shop'] = this.shop;
    data['branch'] = this.branch;
    data['shop_image'] = this.shopImage;
    data['status'] = this.status;
    data['answered_questions'] = this.answeredQuestions;
    data['total_questions'] = this.totalQuestions;
    data['start_time'] = this.startTime;
    data['finish_time'] = this.finishTime;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
