// To parse this JSON data, do
//
//     final verifyMobileOtpModel = verifyMobileOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyMobileOtpModel verifyMobileOtpModelFromJson(String str) => VerifyMobileOtpModel.fromJson(json.decode(str));

String verifyMobileOtpModelToJson(VerifyMobileOtpModel data) => json.encode(data.toJson());

class VerifyMobileOtpModel {
  int? abdmServerCode;
  Content? content;

  VerifyMobileOtpModel({
    this.abdmServerCode,
    this.content,
  });

  factory VerifyMobileOtpModel.fromJson(Map<String, dynamic> json) => VerifyMobileOtpModel(
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
  List<String>? mappedPhrAddress;

  Content({
    this.transactionId,
    this.mappedPhrAddress,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    transactionId: json["transactionId"],
    mappedPhrAddress: json["mappedPhrAddress"] == null ? [] : List<String>.from(json["mappedPhrAddress"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "transactionId": transactionId,
    "mappedPhrAddress": mappedPhrAddress == null ? [] : List<dynamic>.from(mappedPhrAddress!.map((x) => x)),
  };
}
