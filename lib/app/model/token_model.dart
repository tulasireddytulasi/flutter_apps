// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  int? abdmServerCode;
  Content? content;

  TokenModel({
    this.abdmServerCode,
    this.content,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
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

  Content({
    this.token,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    token: json["token"],
    expiresIn: json["expiresIn"],
    refreshToken: json["refreshToken"],
    refreshExpiresIn: json["refreshExpiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiresIn": expiresIn,
    "refreshToken": refreshToken,
    "refreshExpiresIn": refreshExpiresIn,
  };
}
