class TermsModel {
  TermsData? data;
  String? message;
  int? statusCode;

  TermsModel({this.data, this.message, this.statusCode});

  TermsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new TermsData.fromJson(json['data']) : null;
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

class TermsData {
  String? terms;

  TermsData({this.terms});

  TermsData.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.terms;
    return data;
  }
}
