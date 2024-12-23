import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final int status;
  final String msg;
  final Data data;

  LoginModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final String token;
  final String name;
  final String email;
  final dynamic country;
  final dynamic birthday;
  final dynamic wallet;
  final String money;
  final dynamic invitedFrom;
  final String inviteCode;
  final String inviteLink;
  final String type;

  Data({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.country,
    required this.birthday,
    required this.wallet,
    required this.money,
    required this.invitedFrom,
    required this.inviteCode,
    required this.inviteLink,
    required this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        token: json["token"],
        name: json["name"],
        email: json["email"],
        country: json["country"],
        birthday: json["birthday"],
        wallet: json["wallet"],
        money: json["money"],
        invitedFrom: json["invited_from"],
        inviteCode: json["invite_code"],
        inviteLink: json["invite_link"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "name": name,
        "email": email,
        "country": country,
        "birthday": birthday,
        "wallet": wallet,
        "money": money,
        "invited_from": invitedFrom,
        "invite_code": inviteCode,
        "invite_link": inviteLink,
        "type": type,
      };
}
