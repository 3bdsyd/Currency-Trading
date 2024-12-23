import 'dart:convert';

ResultsModel resultsModelFromJson(String str) =>
    ResultsModel.fromJson(json.decode(str));

String resultsModelToJson(ResultsModel data) => json.encode(data.toJson());

class ResultsModel {
  final int status;
  final String msg;
  final Data data;

  ResultsModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
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
  final int allNum;
  final double totalProfit;
  final double avgProfit;
  final int winNum;
  final int loseNum;
  final double winRate;
  final double multiple;

  Data({
    required this.allNum,
    required this.totalProfit,
    required this.avgProfit,
    required this.winNum,
    required this.loseNum,
    required this.winRate,
    required this.multiple,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        allNum: json["all_num"],
        totalProfit: json["total_profit"]?.toDouble(),
        avgProfit: json["avg_profit"]?.toDouble(),
        winNum: json["win_num"],
        loseNum: json["lose_num"],
        winRate: json["win_rate"]?.toDouble(),
        multiple: json["multiple"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "all_num": allNum,
        "total_profit": totalProfit,
        "avg_profit": avgProfit,
        "win_num": winNum,
        "lose_num": loseNum,
        "win_rate": winRate,
        "multiple": multiple,
      };
}
