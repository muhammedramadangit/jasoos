
class SocialAuthModel{
  int? statusCode;
  String? message;
  String? id;
  String? name;
  String? phone;
  String? password;
  String? email;
  String? image;
  String? idToken;
  String? accessToken;

  SocialAuthModel({
    this.statusCode,
    this.message,
    this.id,
    this.name,
    this.phone,
    this.password,
    this.email,
    this.image,
    this.idToken,
    this.accessToken,
  });

  printData() {
    print('status code >>> ${this.statusCode}');
    print('message >>> ${this.message}');
    print('ID >>> ${this.id}');
    print('Email >>> ${this.email}');
    print('Name >>> ${this.name}');
    print('ID Token >>> ${this.idToken}');
    print('Access Token >>> ${this.accessToken}');
    print('Password >>> ${this.password}');
  }
}

class FacebookUserAccount{
  String? name;
  String? lastName;
  String? firstName;
  String? id;
  String? email;

  FacebookUserAccount({this.name, this.lastName, this.firstName, this.id, this.email});

  factory FacebookUserAccount.fromJson(Map<String, dynamic> json) =>
      FacebookUserAccount(
        name: json["name"] == null ? null : json["name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        id: json["id"] == null ? null : json["id"],
      );
}