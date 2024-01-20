// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  String? firstName;
  String? middleName;
  String? lastName;
  String? mobileNo;
  String? gender;
  String? dayOfBirth;
  String? monthOfBirth;
  String? yearOfBirth;

  FormModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobileNo,
    this.gender,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    mobileNo: json["mobileNo"],
    gender: json["gender"],
    dayOfBirth: json["dayOfBirth"],
    monthOfBirth: json["monthOfBirth"],
    yearOfBirth: json["yearOfBirth"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "mobileNo": mobileNo,
    "gender": gender,
    "dayOfBirth": dayOfBirth,
    "monthOfBirth": monthOfBirth,
    "yearOfBirth": yearOfBirth,
  };
}
