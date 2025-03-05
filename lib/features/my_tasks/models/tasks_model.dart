class TasksModel {
  List<TaskInfo>? data;
  String? message;
  int? statusCode;

  TasksModel({this.data, this.message, this.statusCode});

  TasksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TaskInfo>[];
      json['data'].forEach((v) {
        data!.add(new TaskInfo.fromJson(v));
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

class TaskInfo {
  int? id;
  String? name;
  String? description;
  String? type;
  String? reward;
  String? shop;
  String? branch;
  String? shopImage;
  String? distance;
  String? createdAt;
  int? totalQuestions;
  int? answeredQuestions;

  TaskInfo(
      {this.id,
        this.name,
        this.description,
        this.type,
        this.reward,
        this.shop,
        this.branch,
        this.shopImage,
        this.distance,
        this.createdAt,
        this.totalQuestions,
        this.answeredQuestions});

  TaskInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    reward = json['reward'];
    shop = json['shop'];
    branch = json['branch'];
    shopImage = json['shop_image'];
    distance = json['distance'];
    createdAt = json['created_at'];
    totalQuestions = json['total_questions'];
    answeredQuestions = json['answered_questions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['reward'] = this.reward;
    data['shop'] = this.shop;
    data['branch'] = this.branch;
    data['shop_image'] = this.shopImage;
    data['distance'] = this.distance;
    data['created_at'] = this.createdAt;
    data['total_questions'] = this.totalQuestions;
    data['answered_questions'] = this.answeredQuestions;
    return data;
  }
}
