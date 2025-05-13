class RewardsModel {
  List<RewardsInfo>? data;
  String? message;
  int? statusCode;

  RewardsModel({this.data, this.message, this.statusCode});

  RewardsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RewardsInfo>[];
      json['data'].forEach((v) {
        data!.add(new RewardsInfo.fromJson(v));
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

class RewardsInfo {
  int? taskId;
  String? rewardName;
  String? rewardValue;

  RewardsInfo({this.taskId, this.rewardName, this.rewardValue});

  RewardsInfo.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    rewardName = json['reward_name'];
    rewardValue = json['reward_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['reward_name'] = this.rewardName;
    data['reward_value'] = this.rewardValue;
    return data;
  }
}
