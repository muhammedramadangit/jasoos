class UserModel {
  UserDataInfo? data;
  String? message;
  int? statusCode;

  UserModel({this.data, this.message, this.statusCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserDataInfo.fromJson(json['data']) : null;
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

class UserDataInfo {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? maritalStatus;
  String? gender;
  String? dateOfBirth;
  String? profileImage;
  String? idImage;
  String? idNumber;
  String? level;
  String? completedTasks;
  BankAccount? bankAccount;

  UserDataInfo(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.maritalStatus,
        this.gender,
        this.dateOfBirth,
        this.profileImage,
        this.idImage,
        this.idNumber,
        this.level,
        this.completedTasks,
        this.bankAccount});

  UserDataInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    maritalStatus = json['marital_status'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
    idImage = json['id_image'];
    idNumber = json['id_number'];
    level = json['level'];
    completedTasks = json['completed_tasks'].toString();
    bankAccount = json['bank_account'] != null
        ? new BankAccount.fromJson(json['bank_account'])
        : null;
  }

  Map<String, dynamic> checkNullMainKeys() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['marital_status'] = this.maritalStatus;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['marital_status'] = this.maritalStatus;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    data['id_image'] = this.idImage;
    data['id_number'] = this.idNumber;
    data['level'] = this.level;
    data['completed_tasks'] = this.completedTasks;
    if (this.bankAccount != null) {
      data['bank_account'] = this.bankAccount!.toJson();
    }
    return data;
  }
}

class BankAccount {
  String? bankName;
  String? holderName;
  String? iban;

  BankAccount({this.bankName, this.holderName, this.iban});

  BankAccount.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    holderName = json['holder_name'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_name'] = this.bankName;
    data['holder_name'] = this.holderName;
    data['iban'] = this.iban;
    return data;
  }
}
