import 'dart:convert';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
  final String name;
  final double profit;
  final double winRate;
  final int count;

  HistoryModel({
    required this.name,
    required this.profit,
    required this.winRate,
    required this.count,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        name: json["name"],
        profit: json["profit"]?.toDouble(),
        winRate: json["win_rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profit": profit,
        "win_rate": winRate,
        "count": count,
      };
}
