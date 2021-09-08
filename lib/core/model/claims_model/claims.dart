// To parse this JSON data, do
//
//     final claims = claimsFromJson(jsonString);

import 'dart:convert';

import 'package:staj/core/model/base_model/response.dart';
import 'package:staj/core/model/claims_model/claims_data.dart';

Claims claimsFromJson(String str) => Claims.fromJson(json.decode(str));
String claimsToJson(Claims data) => json.encode(data.toJson());

class Claims {
  Claims({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  late final List<Datum>? data;
  final Response? response;
  final int? totalRecords;

  factory Claims.fromJson(Map<String, dynamic> json) => Claims(
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
