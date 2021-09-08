// To parse this JSON data, do
//
//     final listAddress = listAddressFromJson(jsonString);

import 'dart:convert';

ListAddress listAddressFromJson(String str) =>
    ListAddress.fromJson(json.decode(str));

String listAddressToJson(ListAddress data) => json.encode(data.toJson());

class ListAddress {
  ListAddress({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Data>? data;
  final Response? response;
  final int? totalRecords;

  factory ListAddress.fromJson(Map<String, dynamic> json) => ListAddress(
        authorization: json["authorization"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
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

class Data {
  Data({
    this.typ,
    this.invoiceAddressTyp,
    this.invoiceAddressTypId,
    this.typId,
    this.statusId,
    this.vendorId,
    this.userId,
    this.cityId,
    this.city,
    this.townId,
    this.town,
    this.addressTitle,
    this.name,
    this.surname,
    this.isDefault,
    this.address1,
    this.address2,
    this.email,
    this.tel,
    this.fax,
    this.mobile,
    this.invName,
    this.tckNo,
    this.taxNr,
    this.taxOffice,
    this.isEInvoice,
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

  final String? typ;
  final String? invoiceAddressTyp;
  final int? invoiceAddressTypId;
  final int? typId;
  final int? statusId;
  final String? vendorId;
  final String? userId;
  final int? cityId;
  final String? city;
  final int? townId;
  final String? town;
  final String? addressTitle;
  final String? name;
  final String? surname;
  final bool? isDefault;
  final String? address1;
  final dynamic? address2;
  final String? email;
  final String? tel;
  final dynamic? fax;
  final dynamic? mobile;
  final dynamic? invName;
  final String? tckNo;
  final dynamic taxNr;
  final dynamic taxOffice;
  final bool? isEInvoice;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        typ: json["typ"],
        invoiceAddressTyp: json["invoiceAddressTyp"],
        invoiceAddressTypId: json["invoiceAddressTypId"],
        typId: json["typId"],
        statusId: json["statusId"],
        vendorId: json["vendorId"],
        userId: json["userId"],
        cityId: json["cityId"],
        city: json["city"],
        townId: json["townId"],
        town: json["town"],
        addressTitle: json["addressTitle"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        isDefault: json["isDefault"],
        address1: json["address1"],
        address2: json["address2"],
        email: json["email"],
        tel: json["tel"],
        fax: json["fax"],
        mobile: json["mobile"],
        invName: json["invName"],
        tckNo: json["tckNo"],
        taxNr: json["taxNr"],
        taxOffice: json["taxOffice"],
        isEInvoice: json["isEInvoice"],
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
        "typ": typ,
        "invoiceAddressTyp": invoiceAddressTyp,
        "invoiceAddressTypId": invoiceAddressTypId,
        "typId": typId,
        "statusId": statusId,
        "vendorId": vendorId,
        "userId": userId,
        "cityId": cityId,
        "city": city,
        "townId": townId,
        "town": town,
        "addressTitle": addressTitle,
        "name": name == null ? null : name,
        "surname": surname == null ? null : surname,
        "isDefault": isDefault,
        "address1": address1,
        "address2": address2,
        "email": email,
        "tel": tel,
        "fax": fax,
        "mobile": mobile,
        "invName": invName,
        "tckNo": tckNo,
        "taxNr": taxNr,
        "taxOffice": taxOffice,
        "isEInvoice": isEInvoice,
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
