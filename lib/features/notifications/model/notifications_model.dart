class NotificationModel {
  NotificationsData? data;
  String? message;
  int? statusCode;

  NotificationModel({this.data, this.message, this.statusCode});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new NotificationsData.fromJson(json['data']) : null;
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

class NotificationsData {
  List<NotificationsInfo>? notifications;

  NotificationsData({this.notifications});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <NotificationsInfo>[];
      json['notifications'].forEach((v) {
        notifications!.add(new NotificationsInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationsInfo {
  String? title;
  String? body;
  int? taskId;

  NotificationsInfo({this.title, this.body, this.taskId});

  NotificationsInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    taskId = json['task_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['task_id'] = this.taskId;
    return data;
  }
}
