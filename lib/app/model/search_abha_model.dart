// To parse this JSON data, do
//
//     final searchAbhaModel = searchAbhaModelFromJson(jsonString);

import 'dart:convert';

SearchAbhaModel searchAbhaModelFromJson(String str) => SearchAbhaModel.fromJson(json.decode(str));

String searchAbhaModelToJson(SearchAbhaModel data) => json.encode(data.toJson());

class SearchAbhaModel {
  int? abdmServerCode;
  Content? content;

  SearchAbhaModel({
    this.abdmServerCode,
    this.content,
  });

  factory SearchAbhaModel.fromJson(Map<String, dynamic> json) => SearchAbhaModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? healthId;
  dynamic healthIdNumber;
  String? name;
  String? status;
  List<String>? authMethods;
  dynamic tags;

  Content({
    this.healthId,
    this.healthIdNumber,
    this.name,
    this.status,
    this.authMethods,
    this.tags,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    healthId: json["healthId"],
    healthIdNumber: json["healthIdNumber"],
    name: json["name"],
    status: json["status"],
    authMethods: json["authMethods"] == null ? [] : List<String>.from(json["authMethods"]!.map((x) => x)),
    tags: json["tags"],
  );

  Map<String, dynamic> toJson() => {
    "healthId": healthId,
    "healthIdNumber": healthIdNumber,
    "name": name,
    "status": status,
    "authMethods": authMethods == null ? [] : List<dynamic>.from(authMethods!.map((x) => x)),
    "tags": tags,
  };
}
