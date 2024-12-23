// To parse this JSON data, do
//
//     final sendCodeModel = sendCodeModelFromJson(jsonString);

import 'dart:convert';

SendCodeModel sendCodeModelFromJson(String str) =>
    SendCodeModel.fromJson(json.decode(str));

String sendCodeModelToJson(SendCodeModel data) => json.encode(data.toJson());

class SendCodeModel {
  final int status;
  final String msg;
  final Data data;

  SendCodeModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) => SendCodeModel(
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
  final int verificationCode;

  Data({
    required this.verificationCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        verificationCode: json["verification_code"],
      );

  Map<String, dynamic> toJson() => {
        "verification_code": verificationCode,
      };
}
