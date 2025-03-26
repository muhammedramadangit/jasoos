class TasksStatusModel {
  List<TaskStatusInfo>? data;
  String? message;
  int? statusCode;

  TasksStatusModel({this.data, this.message, this.statusCode});

  TasksStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TaskStatusInfo>[];
      json['data'].forEach((v) {
        data!.add(new TaskStatusInfo.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class TaskStatusInfo {
  int? value;
  String? name;

  TaskStatusInfo({this.value, this.name});

  TaskStatusInfo.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['name'] = this.name;
    return data;
  }
}
