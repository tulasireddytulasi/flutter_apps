// To parse this JSON data, do
//
//     final encryptedModel = encryptedModelFromJson(jsonString);

import 'dart:convert';

EncryptedModel encryptedModelFromJson(String str) => EncryptedModel.fromJson(json.decode(str));

String encryptedModelToJson(EncryptedModel data) => json.encode(data.toJson());

class EncryptedModel {
  int? abdmServerCode;
  Content? content;

  EncryptedModel({
    this.abdmServerCode,
    this.content,
  });

  factory EncryptedModel.fromJson(Map<String, dynamic> json) => EncryptedModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? encryptedText;

  Content({
    this.encryptedText,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    encryptedText: json["encryptedText"],
  );

  Map<String, dynamic> toJson() => {
    "encryptedText": encryptedText,
  };
}
