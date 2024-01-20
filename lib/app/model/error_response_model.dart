// To parse this JSON data, do
//
//     final errorResponseModel = errorResponseModelFromJson(jsonString);

import 'dart:convert';

ErrorResponseModel errorResponseModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));

String errorResponseModelToJson(ErrorResponseModel data) => json.encode(data.toJson());

class ErrorResponseModel {
  int? abdmServerCode;
  String? abdmErrCode;
  Message? message;
  String? details;

  ErrorResponseModel({
    this.abdmServerCode,
    this.abdmErrCode,
    this.message,
    this.details,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
    abdmServerCode: json["ABDMServerCode"],
    abdmErrCode: json["ABDMErrCode"],
    message: json["message"] == null ? null : Message.fromJson(json["message"]),
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "ABDMErrCode": abdmErrCode,
    "message": message?.toJson(),
    "details": details,
  };
}

class Message {
  String? code;
  String? message;
  List<Detail>? details;

  Message({
    this.code,
    this.message,
    this.details,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    code: json["code"],
    message: json["message"],
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  String? message;
  String? code;
  Attribute? attribute;

  Detail({
    this.message,
    this.code,
    this.attribute,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    message: json["message"],
    code: json["code"],
    attribute: json["attribute"] == null ? null : Attribute.fromJson(json["attribute"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "attribute": attribute?.toJson(),
  };
}

class Attribute {
  String? key;
  String? value;

  Attribute({
    this.key,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}
