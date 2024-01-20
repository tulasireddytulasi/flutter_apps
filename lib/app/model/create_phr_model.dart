// To parse this JSON data, do
//
//     final createPhrModel = createPhrModelFromJson(jsonString);

import 'dart:convert';

CreatePhrModel createPhrModelFromJson(String str) => CreatePhrModel.fromJson(json.decode(str));

String createPhrModelToJson(CreatePhrModel data) => json.encode(data.toJson());

class CreatePhrModel {
  int? abdmServerCode;
  Content? content;

  CreatePhrModel({
    this.abdmServerCode,
    this.content,
  });

  factory CreatePhrModel.fromJson(Map<String, dynamic> json) => CreatePhrModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? token;
  int? expiresIn;
  String? refreshToken;
  int? refreshExpiresIn;
  String? phrAdress;
  String? authTs;

  Content({
    this.token,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
    this.phrAdress,
    this.authTs,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    token: json["token"],
    expiresIn: json["expiresIn"],
    refreshToken: json["refreshToken"],
    refreshExpiresIn: json["refreshExpiresIn"],
    phrAdress: json["phrAdress"],
    authTs: json["authTs"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiresIn": expiresIn,
    "refreshToken": refreshToken,
    "refreshExpiresIn": refreshExpiresIn,
    "phrAdress": phrAdress,
    "authTs": authTs,
  };
}
