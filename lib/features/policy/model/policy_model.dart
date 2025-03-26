class PolicyModel {
  PolicyData? data;
  String? message;
  int? statusCode;

  PolicyModel({this.data, this.message, this.statusCode});

  PolicyModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new PolicyData.fromJson(json['data']) : null;
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

class PolicyData {
  String? privacy;

  PolicyData({this.privacy});

  PolicyData.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    return data;
  }
}
