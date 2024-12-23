import 'dart:convert';

CheckEmailModel checkEmailModelFromJson(String str) =>
    CheckEmailModel.fromJson(json.decode(str));

String checkEmailModelToJson(CheckEmailModel data) =>
    json.encode(data.toJson());

class CheckEmailModel {
  final int found;

  CheckEmailModel({
    required this.found,
  });

  factory CheckEmailModel.fromJson(Map<String, dynamic> json) =>
      CheckEmailModel(
        found: json["found"],
      );

  Map<String, dynamic> toJson() => {
        "found": found,
      };
}
