// To parse this JSON data, do
//
//     final generalModel = generalModelFromJson(jsonString);

import 'dart:convert';

GeneralModel generalModelFromJson(String str) =>
    GeneralModel.fromJson(json.decode(str));

String generalModelToJson(GeneralModel data) => json.encode(data.toJson());

class GeneralModel {
  final int status;
  final String msg;
  final Data data;

  GeneralModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
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
  final Basic basic;
  final Basic ultimate;
  final String terms;
  final String policy;
  final String partnership;
  final String telegram;
  final String youtube;
  final dynamic whatsapp;
  final String twitter;
  final dynamic discord;
  final int signals;
  final double signalRate;
  final double sliderRatio;
  final int timer;
  final String support;
  final int appVersion;
  final String googleUrl;
  final String appleUrl;
  final String withdrawSentnece;
  final String withdrawAmount;

  Data({
    required this.basic,
    required this.ultimate,
    required this.terms,
    required this.policy,
    required this.partnership,
    required this.telegram,
    required this.youtube,
    required this.whatsapp,
    required this.twitter,
    required this.discord,
    required this.signals,
    required this.signalRate,
    required this.sliderRatio,
    required this.timer,
    required this.support,
    required this.appVersion,
    required this.googleUrl,
    required this.appleUrl,
    required this.withdrawSentnece,
    required this.withdrawAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basic: Basic.fromJson(json["basic"]),
        ultimate: Basic.fromJson(json["ultimate"]),
        terms: json["terms"],
        policy: json["policy"],
        partnership: json["partnership"],
        telegram: json["telegram"],
        youtube: json["youtube"],
        whatsapp: json["whatsapp"],
        twitter: json["twitter"],
        discord: json["discord"],
        signals: json["signals"],
        signalRate: json["signal_rate"]?.toDouble(),
        sliderRatio: json["slider_ratio"]?.toDouble(),
        timer: json["timer"],
        support: json["support"],
        appVersion: json["app_version"],
        googleUrl: json["google_url"],
        appleUrl: json["apple_url"],
        withdrawSentnece: json["withdraw_sentnece"],
        withdrawAmount: json["withdraw_amount"],
      );

  Map<String, dynamic> toJson() => {
        "basic": basic.toJson(),
        "ultimate": ultimate.toJson(),
        "terms": terms,
        "policy": policy,
        "partnership": partnership,
        "telegram": telegram,
        "youtube": youtube,
        "whatsapp": whatsapp,
        "twitter": twitter,
        "discord": discord,
        "signals": signals,
        "signal_rate": signalRate,
        "slider_ratio": sliderRatio,
        "timer": timer,
        "support": support,
        "app_version": appVersion,
        "google_url": googleUrl,
        "apple_url": appleUrl,
        "withdraw_sentnece": withdrawSentnece,
        "withdraw_amount": withdrawAmount,
      };
}

class Basic {
  final String num;
  final String network;
  final String wallet;
  final String oneMonth;
  final String threeMonth;
  final String sixMonth;
  final String onePayMonth;
  final String threePayMonth;
  final String sixPayMonth;

  Basic({
    required this.num,
    required this.network,
    required this.wallet,
    required this.oneMonth,
    required this.threeMonth,
    required this.sixMonth,
    required this.onePayMonth,
    required this.threePayMonth,
    required this.sixPayMonth,
  });

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        num: json["num"],
        network: json["network"],
        wallet: json["wallet"],
        oneMonth: json["one_month"],
        threeMonth: json["three_month"],
        sixMonth: json["six_month"],
        onePayMonth: json["one_pay_month"],
        threePayMonth: json["three_pay_month"],
        sixPayMonth: json["six_pay_month"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "network": network,
        "wallet": wallet,
        "one_month": oneMonth,
        "three_month": threeMonth,
        "six_month": sixMonth,
        "one_pay_month": onePayMonth,
        "three_pay_month": threePayMonth,
        "six_pay_month": sixPayMonth,
      };
}
