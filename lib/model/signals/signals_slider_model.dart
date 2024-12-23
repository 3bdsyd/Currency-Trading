// To parse this JSON data, do
//
//     final signalsSliderModel = signalsSliderModelFromJson(jsonString);

import 'dart:convert';

SignalsSliderModel signalsSliderModelFromJson(String str) =>
    SignalsSliderModel.fromJson(json.decode(str));

String signalsSliderModelToJson(SignalsSliderModel data) =>
    json.encode(data.toJson());

class SignalsSliderModel {
  final int status;
  final String msg;
  final List<Datum> data;

  SignalsSliderModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SignalsSliderModel.fromJson(Map<String, dynamic> json) =>
      SignalsSliderModel(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String image;

  Datum({
    required this.id,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
