// To parse this JSON data, do
//
//     final checkStatus = checkStatusFromJson(jsonString);

import 'dart:convert';

CheckStatus checkStatusFromJson(String str) =>
    CheckStatus.fromJson(json.decode(str));

String checkStatusToJson(CheckStatus data) => json.encode(data.toJson());

class CheckStatus {
  CheckStatus({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final dynamic data;
  final Response? response;
  final dynamic totalRecords;

  factory CheckStatus.fromJson(Map<String, dynamic> json) => CheckStatus(
        authorization: json["authorization"],
        data: json["data"],
        response: Response.fromJson(json["response"]),
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization,
        "data": data,
        "response": response!.toJson(),
        "totalRecords": totalRecords,
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
