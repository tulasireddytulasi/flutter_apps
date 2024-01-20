// To parse this JSON data, do
//
//     final abhaCardModel = abhaCardModelFromJson(jsonString);

import 'dart:convert';

AbhaCardModel abhaCardModelFromJson(String str) => AbhaCardModel.fromJson(json.decode(str));

String abhaCardModelToJson(AbhaCardModel data) => json.encode(data.toJson());

class AbhaCardModel {
  int? abdmServerCode;
  Content? content;

  AbhaCardModel({
    this.abdmServerCode,
    this.content,
  });

  factory AbhaCardModel.fromJson(Map<String, dynamic> json) => AbhaCardModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? hidPhoto;

  Content({
    this.hidPhoto,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    hidPhoto: json["hidPhoto"],
  );

  Map<String, dynamic> toJson() => {
    "hidPhoto": hidPhoto,
  };
}
