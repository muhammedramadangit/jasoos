class UserModel {
  Data? data;
  String? message;
  int? statusCode;

  UserModel({this.data, this.message, this.statusCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? isVerified;
  int? isActive;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.isVerified,
        this.isActive,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['token'] = this.token;
    return data;
  }
}
