// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Datum>? data;
  final Response? response;
  final dynamic totalRecords;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        authorization: json["authorization"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        response: Response.fromJson(json["response"]),
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "response": response!.toJson(),
        "totalRecords": totalRecords,
      };
}

class Datum {
  Datum({
    this.typId,
    this.statusId,
    this.email,
    this.pwd,
    this.isEmailValidated,
    this.mobile,
    this.isMobileValidated,
    this.userName,
    this.firstName,
    this.lastName,
    this.vendorId,
    this.corporateId,
    this.addressId,
    this.isPublished,
    this.address,
    this.companyName,
    this.homeMobile,
    this.taxOffice,
    this.taxNumber,
    this.mersisNo,
    this.cityId,
    this.townId,
    this.id,
    this.objGuid,
    this.isCancelled,
    this.insertionDate,
    this.insertedBy,
    this.modifiedDate,
    this.modifiedBy,
    this.page,
    this.pageLimit,
    this.orderBy,
    this.ip,
    this.entityCacheKey,
  });

  final int? typId;
  final int? statusId;
  final String? email;
  final String? pwd;
  final bool? isEmailValidated;
  final String? mobile;
  final bool? isMobileValidated;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? vendorId;
  final dynamic corporateId;
  final String? addressId;
  final bool? isPublished;
  final dynamic address;
  final dynamic companyName;
  final dynamic homeMobile;
  final dynamic taxOffice;
  final dynamic taxNumber;
  final dynamic mersisNo;
  final dynamic cityId;
  final dynamic townId;
  final int? id;
  final String? objGuid;
  final bool? isCancelled;
  final DateTime? insertionDate;
  final String? insertedBy;
  final dynamic modifiedDate;
  final String? modifiedBy;
  final int? page;
  final int? pageLimit;
  final String? orderBy;
  final String? ip;
  final String? entityCacheKey;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        typId: json["typId"],
        statusId: json["statusId"],
        email: json["email"],
        pwd: json["pwd"],
        isEmailValidated: json["isEmailValidated"],
        mobile: json["mobile"],
        isMobileValidated: json["isMobileValidated"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        vendorId: json["vendorId"],
        corporateId: json["corporateId"],
        addressId: json["addressId"],
        isPublished: json["isPublished"],
        address: json["address"],
        companyName: json["companyName"],
        homeMobile: json["homeMobile"],
        taxOffice: json["taxOffice"],
        taxNumber: json["taxNumber"],
        mersisNo: json["mersisNo"],
        cityId: json["cityId"],
        townId: json["townId"],
        id: json["id"],
        objGuid: json["objGuid"],
        isCancelled: json["isCancelled"],
        insertionDate: DateTime.parse(json["insertionDate"]),
        insertedBy: json["insertedBy"],
        modifiedDate: json["modifiedDate"],
        modifiedBy: json["modifiedBy"],
        page: json["page"],
        pageLimit: json["pageLimit"],
        orderBy: json["orderBy"],
        ip: json["ip"],
        entityCacheKey: json["entityCacheKey"],
      );

  Map<String, dynamic> toJson() => {
        "typId": typId,
        "statusId": statusId,
        "email": email,
        "pwd": pwd,
        "isEmailValidated": isEmailValidated,
        "mobile": mobile,
        "isMobileValidated": isMobileValidated,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "vendorId": vendorId,
        "corporateId": corporateId,
        "addressId": addressId,
        "isPublished": isPublished,
        "address": address,
        "companyName": companyName,
        "homeMobile": homeMobile,
        "taxOffice": taxOffice,
        "taxNumber": taxNumber,
        "mersisNo": mersisNo,
        "cityId": cityId,
        "townId": townId,
        "id": id,
        "objGuid": objGuid,
        "isCancelled": isCancelled,
        "insertionDate": insertionDate!.toIso8601String(),
        "insertedBy": insertedBy,
        "modifiedDate": modifiedDate,
        "modifiedBy": modifiedBy,
        "page": page,
        "pageLimit": pageLimit,
        "orderBy": orderBy,
        "ip": ip,
        "entityCacheKey": entityCacheKey,
      };
}

class Response {
  Response({
    this.result,
    this.resultCode,
    this.resultMsg,
    this.refNumber,
  });

  final bool? result;
  final String? resultCode;
  final String? resultMsg;
  final dynamic refNumber;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        result: json["result"],
        resultCode: json["resultCode"],
        resultMsg: json["resultMsg"],
        refNumber: json["refNumber"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "resultCode": resultCode,
        "resultMsg": resultMsg,
        "refNumber": refNumber,
      };
}
