class QuestionsModel {
  List<QuestionInfo>? data;
  String? message;
  int? statusCode;

  QuestionsModel({this.data, this.message, this.statusCode});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuestionInfo>[];
      json['data'].forEach((v) {
        data!.add(new QuestionInfo.fromJson(v));
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

class QuestionInfo {
  int? id;
  String? question;
  int? questionTypeId;
  int? isAnswered;
  List<String>? options;

  QuestionInfo(
      {this.id,
        this.question,
        this.questionTypeId,
        this.isAnswered,
        this.options});

  QuestionInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionTypeId = json['question_type_id'];
    isAnswered = json['is_answered'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_type_id'] = this.questionTypeId;
    data['is_answered'] = this.isAnswered;
    data['options'] = this.options;
    return data;
  }
}
