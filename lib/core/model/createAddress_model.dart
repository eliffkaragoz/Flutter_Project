// To parse this JSON data, do
//
//     final createAddress = createAddressFromJson(jsonString);

import 'dart:convert';

CreateAddress createAddressFromJson(String str) =>
    CreateAddress.fromJson(json.decode(str));

String createAddressToJson(CreateAddress data) => json.encode(data.toJson());

class CreateAddress {
  CreateAddress({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final dynamic data;
  final CreateAddressResponse? response;
  final dynamic totalRecords;

  factory CreateAddress.fromJson(Map<String, dynamic> json) => CreateAddress(
        authorization: json["authorization"],
        data: json["data"],
        response: CreateAddressResponse.fromJson(json["response"]),
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization,
        "data": data,
        "response": response!.toJson(),
        "totalRecords": totalRecords,
      };
}

class CreateAddressResponse {
  CreateAddressResponse({
    this.result,
    this.resultCode,
    this.resultMsg,
    this.refNumber,
  });

  final bool? result;
  final String? resultCode;
  final String? resultMsg;
  final dynamic refNumber;

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      CreateAddressResponse(
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
