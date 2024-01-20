// To parse this JSON data, do
//
//     final phrAddressModel = phrAddressModelFromJson(jsonString);

import 'dart:convert';

PhrAddressModel phrAddressModelFromJson(String str) => PhrAddressModel.fromJson(json.decode(str));

String phrAddressModelToJson(PhrAddressModel data) => json.encode(data.toJson());

class PhrAddressModel {
  int? abdmServerCode;
  Content? content;

  PhrAddressModel({
    this.abdmServerCode,
    this.content,
  });

  factory PhrAddressModel.fromJson(Map<String, dynamic> json) => PhrAddressModel(
    abdmServerCode: json["ABDMServerCode"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "ABDMServerCode": abdmServerCode,
    "content": content?.toJson(),
  };
}

class Content {
  String? healthIdNumber;
  String? healthId;
  String? mobile;
  String? firstName;
  String? middleName;
  String? lastName;
  String? name;
  String? yearOfBirth;
  String? dayOfBirth;
  String? monthOfBirth;
  String? gender;
  String? email;
  String? profilePhoto;
  String? stateCode;
  String? districtCode;
  String? subDistrictCode;
  String? villageCode;
  String? townCode;
  String? wardCode;
  String? pincode;
  String? address;
  String? kycPhoto;
  String? stateName;
  String? districtName;
  String? subdistrictName;
  String? villageName;
  String? townName;
  String? wardName;
  List<String>? authMethods;
  Tags? tags;
  bool? kycVerified;
  dynamic verificationStatus;
  dynamic verificationType;
  String? clientId;
  List<String>? phrAddress;
  bool? emailVerified;
  bool? contentNew;
  String? token;

  Content({
    this.healthIdNumber,
    this.healthId,
    this.mobile,
    this.firstName,
    this.middleName,
    this.lastName,
    this.name,
    this.yearOfBirth,
    this.dayOfBirth,
    this.monthOfBirth,
    this.gender,
    this.email,
    this.profilePhoto,
    this.stateCode,
    this.districtCode,
    this.subDistrictCode,
    this.villageCode,
    this.townCode,
    this.wardCode,
    this.pincode,
    this.address,
    this.kycPhoto,
    this.stateName,
    this.districtName,
    this.subdistrictName,
    this.villageName,
    this.townName,
    this.wardName,
    this.authMethods,
    this.tags,
    this.kycVerified,
    this.verificationStatus,
    this.verificationType,
    this.clientId,
    this.phrAddress,
    this.emailVerified,
    this.contentNew,
    this.token,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    healthIdNumber: json["healthIdNumber"],
    healthId: json["healthId"],
    mobile: json["mobile"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    name: json["name"],
    yearOfBirth: json["yearOfBirth"],
    dayOfBirth: json["dayOfBirth"],
    monthOfBirth: json["monthOfBirth"],
    gender: json["gender"],
    email: json["email"],
    profilePhoto: json["profilePhoto"],
    stateCode: json["stateCode"],
    districtCode: json["districtCode"],
    subDistrictCode: json["subDistrictCode"],
    villageCode: json["villageCode"],
    townCode: json["townCode"],
    wardCode: json["wardCode"],
    pincode: json["pincode"],
    address: json["address"],
    kycPhoto: json["kycPhoto"],
    stateName: json["stateName"],
    districtName: json["districtName"],
    subdistrictName: json["subdistrictName"],
    villageName: json["villageName"],
    townName: json["townName"],
    wardName: json["wardName"],
    authMethods: json["authMethods"] == null ? [] : List<String>.from(json["authMethods"]!.map((x) => x)),
    tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
    kycVerified: json["kycVerified"],
    verificationStatus: json["verificationStatus"],
    verificationType: json["verificationType"],
    clientId: json["clientId"],
    phrAddress: json["phrAddress"] == null ? [] : List<String>.from(json["phrAddress"]!.map((x) => x)),
    emailVerified: json["emailVerified"],
    contentNew: json["new"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "healthIdNumber": healthIdNumber,
    "healthId": healthId,
    "mobile": mobile,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "name": name,
    "yearOfBirth": yearOfBirth,
    "dayOfBirth": dayOfBirth,
    "monthOfBirth": monthOfBirth,
    "gender": gender,
    "email": email,
    "profilePhoto": profilePhoto,
    "stateCode": stateCode,
    "districtCode": districtCode,
    "subDistrictCode": subDistrictCode,
    "villageCode": villageCode,
    "townCode": townCode,
    "wardCode": wardCode,
    "pincode": pincode,
    "address": address,
    "kycPhoto": kycPhoto,
    "stateName": stateName,
    "districtName": districtName,
    "subdistrictName": subdistrictName,
    "villageName": villageName,
    "townName": townName,
    "wardName": wardName,
    "authMethods": authMethods == null ? [] : List<dynamic>.from(authMethods!.map((x) => x)),
    "tags": tags?.toJson(),
    "kycVerified": kycVerified,
    "verificationStatus": verificationStatus,
    "verificationType": verificationType,
    "clientId": clientId,
    "phrAddress": phrAddress == null ? [] : List<dynamic>.from(phrAddress!.map((x) => x)),
    "emailVerified": emailVerified,
    "new": contentNew,
    "token": token,
  };
}

class Tags {
  Tags();

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
  );

  Map<String, dynamic> toJson() => {
  };
}