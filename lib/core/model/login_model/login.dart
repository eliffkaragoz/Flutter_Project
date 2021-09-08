// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Datum>? data;
  final Response? response;
  final dynamic totalRecords;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
    this.userId,
    this.userType,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
    this.vendorId,
    this.refreshToken,
  });

  final String? userId;
  final int? userType;
  final dynamic firstName;
  final dynamic lastName;
  final String? email;
  final String? token;
  final String? vendorId;
  final String? refreshToken;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["userId"],
        userType: json["userType"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        token: json["token"],
        vendorId: json["vendorId"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userType": userType,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "token": token,
        "vendorId": vendorId,
        "refreshToken": refreshToken,
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
