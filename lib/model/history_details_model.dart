// To parse this JSON data, do
//
//     final historyDetailsModel = historyDetailsModelFromJson(jsonString);

import 'dart:convert';

HistoryDetailsModel historyDetailsModelFromJson(String str) =>
    HistoryDetailsModel.fromJson(json.decode(str));

String historyDetailsModelToJson(HistoryDetailsModel data) =>
    json.encode(data.toJson());

class HistoryDetailsModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  HistoryDetailsModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  final String status;
  final String currencyType;
  final String type;
  final String leverage;
  final DateTime createdAt;
  final int targets;

  Datum({
    required this.status,
    required this.currencyType,
    required this.type,
    required this.leverage,
    required this.createdAt,
    required this.targets,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        currencyType: json["currency_type"],
        type: json["type"],
        leverage: json["leverage"],
        createdAt: DateTime.parse(json["created_at"]),
        targets: json["targets"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "currency_type": currencyType,
        "type": type,
        "leverage": leverage,
        "created_at": createdAt.toIso8601String(),
        "targets": targets,
      };
}

class Links {
  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
