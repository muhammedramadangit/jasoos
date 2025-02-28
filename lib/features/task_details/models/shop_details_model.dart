import '../../home/models/shops_model.dart';

class ShopDetailsModel {
  ShopInfo? data;
  String? message;
  int? statusCode;

  ShopDetailsModel({this.data, this.message, this.statusCode});

  ShopDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ShopInfo.fromJson(json['data']) : null;
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
