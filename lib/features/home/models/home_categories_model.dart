class HomeCategoriesModel {
  List<HomeCategoryInfo>? data;
  String? message;
  int? statusCode;

  HomeCategoriesModel({this.data, this.message, this.statusCode});

  HomeCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeCategoryInfo>[];
      json['data'].forEach((v) {
        data!.add(new HomeCategoryInfo.fromJson(v));
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

class HomeCategoryInfo {
  int? id;
  String? name;

  HomeCategoryInfo({this.id, this.name});

  HomeCategoryInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
