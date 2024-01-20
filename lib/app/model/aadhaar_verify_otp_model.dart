// To parse this JSON data, do
//
//     final aadhaarVerifyOtpModel = aadhaarVerifyOtpModelFromJson(jsonString);

import 'dart:convert';

AadhaarVerifyOtpModel aadhaarVerifyOtpModelFromJson(String str) => AadhaarVerifyOtpModel.fromJson(json.decode(str));

String aadhaarVerifyOtpModelToJson(AadhaarVerifyOtpModel data) => json.encode(data.toJson());

class AadhaarVerifyOtpModel {
  int? abdmServerCode;
  Content? content;

  AadhaarVerifyOtpModel({
    this.abdmServerCode,
    this.content,
  });

  factory AadhaarVerifyOtpModel.fromJson(Map<String, dynamic> json) => AadhaarVerifyOtpModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? photo;
  String? gender;
  String? name;
  String? email;
  String? phone;
  String? pincode;
  String? birthdate;
  String? careOf;
  String? house;
  String? street;
  String? landmark;
  String? locality;
  String? villageTownCity;
  String? subDist;
  String? district;
  String? state;
  String? postOffice;
  String? aadhaar;
  String? txnId;
  String? healthId;
  String? healthIdNumber;
  JwtResponse? jwtResponse;
  bool? contentNew;
  bool? flagEa;

  Content({
    this.photo,
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.pincode,
    this.birthdate,
    this.careOf,
    this.house,
    this.street,
    this.landmark,
    this.locality,
    this.villageTownCity,
    this.subDist,
    this.district,
    this.state,
    this.postOffice,
    this.aadhaar,
    this.txnId,
    this.healthId,
    this.healthIdNumber,
    this.jwtResponse,
    this.contentNew,
    this.flagEa,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    photo: json["photo"],
    gender: json["gender"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    pincode: json["pincode"],
    birthdate: json["birthdate"],
    careOf: json["careOf"],
    house: json["house"],
    street: json["street"],
    landmark: json["landmark"],
    locality: json["locality"],
    villageTownCity: json["villageTownCity"],
    subDist: json["subDist"],
    district: json["district"],
    state: json["state"],
    postOffice: json["postOffice"],
    aadhaar: json["aadhaar"],
    txnId: json["txnId"],
    healthId: json["healthId"],
    healthIdNumber: json["healthIdNumber"],
    jwtResponse: json["jwtResponse"] == null ? null : JwtResponse.fromJson(json["jwtResponse"]),
    contentNew: json["new"],
    flagEa: json["flagEA"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
    "gender": gender,
    "name": name,
    "email": email,
    "phone": phone,
    "pincode": pincode,
    "birthdate": birthdate,
    "careOf": careOf,
    "house": house,
    "street": street,
    "landmark": landmark,
    "locality": locality,
    "villageTownCity": villageTownCity,
    "subDist": subDist,
    "district": district,
    "state": state,
    "postOffice": postOffice,
    "aadhaar": aadhaar,
    "txnId": txnId,
    "healthId": healthId,
    "healthIdNumber": healthIdNumber,
    "jwtResponse": jwtResponse?.toJson(),
    "new": contentNew,
    "flagEA": flagEa,
  };
}

class JwtResponse {
  String? token;
  int? expiresIn;
  String? refreshToken;
  int? refreshExpiresIn;

  JwtResponse({
    this.token,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> json) => JwtResponse(
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
