// To parse this JSON data, do
//
//     final aadhaarOtpModel = aadhaarOtpModelFromJson(jsonString);

import 'dart:convert';

AadhaarOtpModel aadhaarOtpModelFromJson(String str) => AadhaarOtpModel.fromJson(json.decode(str));

String aadhaarOtpModelToJson(AadhaarOtpModel data) => json.encode(data.toJson());

class AadhaarOtpModel {
  int? abdmServerCode;
  Content? content;

  AadhaarOtpModel({
    this.abdmServerCode,
    this.content,
  });

  factory AadhaarOtpModel.fromJson(Map<String, dynamic> json) => AadhaarOtpModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? txnId;
  String? mobileNumber;

  Content({
    this.txnId,
    this.mobileNumber,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    txnId: json["txnId"],
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "txnId": txnId,
    "mobileNumber": mobileNumber,
  };
}
