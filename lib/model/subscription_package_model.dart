
import 'dart:convert';

SubscriptionPackageModel subscriptionPackageModelFromJson(String str) =>
    SubscriptionPackageModel.fromJson(json.decode(str));

String subscriptionPackageModelToJson(SubscriptionPackageModel data) =>
    json.encode(data.toJson());

class SubscriptionPackageModel {
  final String type;
  final String standerBasic1;
  final String basic1;
  final String standerBasic3;
  final String basic3;
  final String standerBasic6;
  final String basic6;
  final String standerUltimate1;
  final String ultimate1;
  final String standerUltimate3;
  final String ultimate3;
  final String standerUltimate6;
  final String ultimate6;

  SubscriptionPackageModel({
    required this.type,
    required this.standerBasic1,
    required this.basic1,
    required this.standerBasic3,
    required this.basic3,
    required this.standerBasic6,
    required this.basic6,
    required this.standerUltimate1,
    required this.ultimate1,
    required this.standerUltimate3,
    required this.ultimate3,
    required this.standerUltimate6,
    required this.ultimate6,
  });

  factory SubscriptionPackageModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionPackageModel(
        type: json["type"],
        standerBasic1: json["stander_basic_1"],
        basic1: json["basic_1"],
        standerBasic3: json["stander_basic_3"],
        basic3: json["basic_3"],
        standerBasic6: json["stander_basic_6"],
        basic6: json["basic_6"],
        standerUltimate1: json["stander_ultimate_1"],
        ultimate1: json["ultimate_1"],
        standerUltimate3: json["stander_ultimate_3"],
        ultimate3: json["ultimate_3"],
        standerUltimate6: json["stander_ultimate_6"],
        ultimate6: json["ultimate_6"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "stander_basic_1": standerBasic1,
        "basic_1": basic1,
        "stander_basic_3": standerBasic3,
        "basic_3": basic3,
        "stander_basic_6": standerBasic6,
        "basic_6": basic6,
        "stander_ultimate_1": standerUltimate1,
        "ultimate_1": ultimate1,
        "stander_ultimate_3": standerUltimate3,
        "ultimate_3": ultimate3,
        "stander_ultimate_6": standerUltimate6,
        "ultimate_6": ultimate6,
      };
}
