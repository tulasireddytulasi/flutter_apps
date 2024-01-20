// To parse this JSON data, do
//
//     final mobileLinkedModel = mobileLinkedModelFromJson(jsonString);

import 'dart:convert';

MobileLinkedModel mobileLinkedModelFromJson(String str) => MobileLinkedModel.fromJson(json.decode(str));

String mobileLinkedModelToJson(MobileLinkedModel data) => json.encode(data.toJson());

class MobileLinkedModel {
  int? abdmServerCode;
  Content? content;

  MobileLinkedModel({
    this.abdmServerCode,
    this.content,
  });

  factory MobileLinkedModel.fromJson(Map<String, dynamic> json) => MobileLinkedModel(
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
  bool? mobileLinked;

  Content({
    this.txnId,
    this.mobileLinked,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    txnId: json["txnId"],
    mobileLinked: json["mobileLinked"],
  );

  Map<String, dynamic> toJson() => {
    "txnId": txnId,
    "mobileLinked": mobileLinked,
  };
}
