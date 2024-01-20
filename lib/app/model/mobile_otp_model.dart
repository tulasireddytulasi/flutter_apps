// To parse this JSON data, do
//
//     final mobileOtpModel = mobileOtpModelFromJson(jsonString);

import 'dart:convert';

MobileOtpModel mobileOtpModelFromJson(String str) => MobileOtpModel.fromJson(json.decode(str));

String mobileOtpModelToJson(MobileOtpModel data) => json.encode(data.toJson());

class MobileOtpModel {
  int? abdmServerCode;
  Content? content;

  MobileOtpModel({
    this.abdmServerCode,
    this.content,
  });

  factory MobileOtpModel.fromJson(Map<String, dynamic> json) => MobileOtpModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? transactionId;

  Content({
    this.transactionId,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    transactionId: json["transactionId"],
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
  };
}
