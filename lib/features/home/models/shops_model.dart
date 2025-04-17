class ShopsModel {
  List<ShopInfo>? data;
  String? message;
  int? statusCode;

  ShopsModel({this.data, this.message, this.statusCode});

  ShopsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShopInfo>[];
      json['data'].forEach((v) {
        data!.add(new ShopInfo.fromJson(v));
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

class ShopInfo {
  int? id;
  String? name;
  String? image;
  String? taskName;
  String? latitude;
  String? longitude;
  int? tasksCount;
  String? distance;
  List<Tasks>? tasks;

  ShopInfo(
      {this.id,
        this.name,
        this.image,
        this.taskName,
        this.latitude,
        this.longitude,
        this.tasksCount,
        this.distance,
        this.tasks});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    taskName = json['task_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tasksCount = json['tasks_count'];
    distance = json['distance'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['task_name'] = this.taskName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['tasks_count'] = this.tasksCount;
    data['distance'] = this.distance;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? id;
  String? name;
  String? description;
  String? type;
  String? reward;
  int? status;

  Tasks({this.id, this.name, this.description, this.type, this.reward, this.status});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    reward = json['reward'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['reward'] = this.reward;
    data['status'] = this.status;
    return data;
  }
}
