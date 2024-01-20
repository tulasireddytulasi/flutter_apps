// To parse this JSON data, do
//
//     final verifyPhrAddressModel = verifyPhrAddressModelFromJson(jsonString);

import 'dart:convert';

VerifyPhrAddressModel verifyPhrAddressModelFromJson(String str) => VerifyPhrAddressModel.fromJson(json.decode(str));

String verifyPhrAddressModelToJson(VerifyPhrAddressModel data) => json.encode(data.toJson());

class VerifyPhrAddressModel {
  int? abdmServerCode;
  Content? content;

  VerifyPhrAddressModel({
    this.abdmServerCode,
    this.content,
  });

  factory VerifyPhrAddressModel.fromJson(Map<String, dynamic> json) => VerifyPhrAddressModel(
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
