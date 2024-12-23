import 'dart:convert';

SignalDetailsModel signalDetailsModelFromJson(String str) =>
    SignalDetailsModel.fromJson(json.decode(str));

String signalDetailsModelToJson(SignalDetailsModel data) =>
    json.encode(data.toJson());

class SignalDetailsModel {
  final int status;
  final String msg;
  final Data data;

  SignalDetailsModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SignalDetailsModel.fromJson(Map<String, dynamic> json) =>
      SignalDetailsModel(
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
  final String currencyType;
  final double percentage;
  final int up;
  final String type;
  final int open;
  final String account;
  final String entry;
  final String stop;
  final String leverage;
  final double currentPrice;
  final dynamic analysisLink;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int doneTargets;
  final List<Target> targets;

  Data({
    required this.id,
    required this.currencyType,
    required this.percentage,
    required this.up,
    required this.type,
    required this.open,
    required this.account,
    required this.entry,
    required this.stop,
    required this.leverage,
    required this.currentPrice,
    required this.analysisLink,
    required this.createdAt,
    required this.updatedAt,
    required this.doneTargets,
    required this.targets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        currencyType: json["currency_type"],
        percentage: json["percentage"]?.toDouble(),
        up: json["up"],
        type: json["type"],
        open: json["open"],
        account: json["account"],
        entry: json["entry"],
        stop: json["stop"],
        leverage: json["leverage"],
        currentPrice: json["current_price"]?.toDouble(),
        analysisLink: json["analysis_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doneTargets: json["done_targets"],
        targets:
            List<Target>.from(json["targets"].map((x) => Target.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency_type": currencyType,
        "percentage": percentage,
        "up": up,
        "type": type,
        "open": open,
        "account": account,
        "entry": entry,
        "stop": stop,
        "leverage": leverage,
        "current_price": currentPrice,
        "analysis_link": analysisLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "done_targets": doneTargets,
        "targets": List<dynamic>.from(targets.map((x) => x.toJson())),
      };
}

class Target {
  final int id;
  final String target;
  final String isDone;
  final String percentage;
  final int up;

  Target({
    required this.id,
    required this.target,
    required this.isDone,
    required this.percentage,
    required this.up,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        target: json["target"],
        isDone: json["is_done"],
        percentage: json["percentage"],
        up: json["up"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "target": target,
        "is_done": isDone,
        "percentage": percentage,
        "up": up,
      };
}
