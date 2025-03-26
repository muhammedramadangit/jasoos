class HelpModel {
  HelpData? data;
  String? message;
  int? statusCode;

  HelpModel({this.data, this.message, this.statusCode});

  HelpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new HelpData.fromJson(json['data']) : null;
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

class HelpData {
  List<HelpFaqs>? faqs;

  HelpData({this.faqs});

  HelpData.fromJson(Map<String, dynamic> json) {
    if (json['faqs'] != null) {
      faqs = <HelpFaqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new HelpFaqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HelpFaqs {
  String? question;
  String? answer;

  HelpFaqs({this.question, this.answer});

  HelpFaqs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
