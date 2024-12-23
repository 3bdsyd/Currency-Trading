import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final int status;
  final String msg;
  final Data data;

  RegisterModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
  final String inviteCode;
  final String inviteLink;
  final String money;
  final dynamic coupon;
  final String type;

  Data({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.country,
    required this.birthday,
    required this.wallet,
    required this.inviteCode,
    required this.inviteLink,
    required this.money,
    required this.coupon,
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
        inviteCode: json["invite_code"],
        inviteLink: json["invite_link"],
        money: json["money"],
        coupon: json["coupon"],
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
        "invite_code": inviteCode,
        "invite_link": inviteLink,
        "money": money,
        "coupon": coupon,
        "type": type,
      };
}
