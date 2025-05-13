class InvitationCodeModel {
  CodeData? data;
  String? message;
  int? statusCode;

  InvitationCodeModel({this.data, this.message, this.statusCode});

  InvitationCodeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CodeData.fromJson(json['data']) : null;
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

class CodeData {
  String? invitationCode;

  CodeData({this.invitationCode});

  CodeData.fromJson(Map<String, dynamic> json) {
    invitationCode = json['invitation_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invitation_code'] = this.invitationCode;
    return data;
  }
}
