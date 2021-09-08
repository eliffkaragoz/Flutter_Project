// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));

String offerToJson(Offer data) => json.encode(data.toJson());

class Offer {
  Offer({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Datum>? data;
  final Response? response;
  final int? totalRecords;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
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
    this.objGuid,
    this.nr,
    this.customerId,
    this.statusId,
    this.status,
    this.date,
    this.title,
    this.cityId,
    this.city,
    this.townId,
    this.town,
    this.rejectReasonId,
    this.rejectReason,
    this.rejectNote,
    this.publishedTill,
    this.published,
    this.url,
    this.catText,
    this.brandLogo,
    this.insertionDate,
    this.approvedDate,
    this.mainCat,
    this.marka,
    this.model,
    this.kasa,
    this.modelYili,
    this.motor,
    this.beygir,
    this.address,
    this.vc,
    this.elapsedTime,
    this.remaingTime,
    this.lines,
    this.media,
  });

  final String? objGuid;
  final String? nr;
  final String? customerId;
  final int? statusId;
  final String? status;
  final DateTime? date;
  final String? title;
  final int? cityId;
  final String? city;
  final int? townId;
  final String? town;
  final int? rejectReasonId;
  final dynamic rejectReason;
  final dynamic rejectNote;
  final dynamic publishedTill;
  final bool? published;
  final dynamic url;
  final String? catText;
  final String? brandLogo;
  final DateTime? insertionDate;
  final dynamic approvedDate;
  final Address? mainCat;
  final Address? marka;
  final Address? model;
  final Address? kasa;
  final Address? modelYili;
  final Address? motor;
  final Address? beygir;
  final Address? address;
  final int? vc;
  final String? elapsedTime;
  final String? remaingTime;
  final List<Line>? lines;
  final Media? media;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        objGuid: json["objGuid"],
        nr: json["nr"],
        customerId: json["customerId"],
        statusId: json["statusId"],
        status: json["status"],
        date: DateTime.parse(json["date_"]),
        title: json["title"],
        cityId: json["cityId"],
        city: json["city"],
        townId: json["townId"],
        town: json["town"],
        rejectReasonId: json["rejectReasonId"],
        rejectReason: json["rejectReason"],
        rejectNote: json["rejectNote"],
        publishedTill: json["publishedTill"],
        published: json["published"],
        url: json["url"],
        catText: json["catText"],
        brandLogo: json["brandLogo"],
        insertionDate: DateTime.parse(json["insertionDate"]),
        approvedDate: json["approvedDate_"],
        mainCat: Address.fromJson(json["mainCat"]),
        marka: Address.fromJson(json["marka"]),
        model: Address.fromJson(json["model"]),
        kasa: Address.fromJson(json["kasa"]),
        modelYili: Address.fromJson(json["modelYili"]),
        motor: Address.fromJson(json["motor"]),
        beygir: Address.fromJson(json["beygir"]),
        address: Address.fromJson(json["address"]),
        vc: json["vc"],
        elapsedTime: json["elapsedTime"],
        remaingTime: json["remaingTime"],
        lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "objGuid": objGuid,
        "nr": nr,
        "customerId": customerId,
        "statusId": statusId,
        "status": status,
        "date_": date!.toIso8601String(),
        "title": title,
        "cityId": cityId,
        "city": city,
        "townId": townId,
        "town": town,
        "rejectReasonId": rejectReasonId,
        "rejectReason": rejectReason,
        "rejectNote": rejectNote,
        "publishedTill": publishedTill,
        "published": published,
        "url": url,
        "catText": catText,
        "brandLogo": brandLogo,
        "insertionDate": insertionDate!.toIso8601String(),
        "approvedDate_": approvedDate,
        "mainCat": mainCat!.toJson(),
        "marka": marka!.toJson(),
        "model": model!.toJson(),
        "kasa": kasa!.toJson(),
        "modelYili": modelYili!.toJson(),
        "motor": motor!.toJson(),
        "beygir": beygir!.toJson(),
        "address": address!.toJson(),
        "vc": vc,
        "elapsedTime": elapsedTime,
        "remaingTime": remaingTime,
        "lines": List<dynamic>.from(lines!.map((x) => x.toJson())),
        "media": media!.toJson(),
      };
}

class Address {
  Address({
    this.id,
    this.text,
    this.idRef,
  });

  final String? id;
  final String? text;
  final String? idRef;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        text: json["text"] == null ? null : json["text"],
        idRef: json["idRef"] == null ? null : json["idRef"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "text": text == null ? null : text,
        "idRef": idRef == null ? null : idRef,
      };
}

class Line {
  Line({
    this.objGuid,
    this.reqId,
    this.nr,
    this.lineNr,
    this.partNumber,
    this.partTitle,
    this.partNote,
    this.note,
    this.rc,
    this.vc,
    this.minPrice,
    this.avgPrice,
    this.maxPrice,
    this.statusId,
    this.status,
    this.isDisabled,
    this.isViewed,
    this.isVendorResponded,
    this.unReadRc,
    this.isVendorOrdered,
    this.responseList,
    this.orderLines,
  });

  final String? objGuid;
  final String? reqId;
  final String? nr;
  final int? lineNr;
  final String? partNumber;
  final String? partTitle;
  final String? partNote;
  final String? note;
  final int? rc;
  final int? vc;
  final double? minPrice;
  final double? avgPrice;
  final double? maxPrice;
  final int? statusId;
  final String? status;
  final bool? isDisabled;
  final bool? isViewed;
  final bool? isVendorResponded;
  final int? unReadRc;
  final bool? isVendorOrdered;
  final List<ResponseList>? responseList;
  final List<dynamic>? orderLines;

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        objGuid: json["objGuid"],
        reqId: json["reqId"],
        nr: json["nr"],
        lineNr: json["lineNr"],
        partNumber: json["partNumber"],
        partTitle: json["partTitle"],
        partNote: json["partNote"],
        note: json["note"],
        rc: json["rc"],
        vc: json["vc"],
        minPrice: json["minPrice"].toDouble(),
        avgPrice: json["avgPrice"].toDouble(),
        maxPrice: json["maxPrice"].toDouble(),
        statusId: json["statusId"],
        status: json["status"],
        isDisabled: json["isDisabled"],
        isViewed: json["isViewed"],
        isVendorResponded: json["isVendorResponded"],
        unReadRc: json["unReadRc"],
        isVendorOrdered: json["isVendorOrdered"],
        responseList: List<ResponseList>.from(
            json["responseList"].map((x) => ResponseList.fromJson(x))),
        orderLines: List<dynamic>.from(json["orderLines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "objGuid": objGuid,
        "reqId": reqId,
        "nr": nr,
        "lineNr": lineNr,
        "partNumber": partNumber,
        "partTitle": partTitle,
        "partNote": partNote,
        "note": note,
        "rc": rc,
        "vc": vc,
        "minPrice": minPrice,
        "avgPrice": avgPrice,
        "maxPrice": maxPrice,
        "statusId": statusId,
        "status": status,
        "isDisabled": isDisabled,
        "isViewed": isViewed,
        "isVendorResponded": isVendorResponded,
        "unReadRc": unReadRc,
        "isVendorOrdered": isVendorOrdered,
        "responseList":
            List<dynamic>.from(responseList!.map((x) => x.toJson())),
        "orderLines": List<dynamic>.from(orderLines!.map((x) => x)),
      };
}

class ResponseList {
  ResponseList({
    this.date,
    this.respId,
    this.reqId,
    this.reqLineId,
    this.respLineId,
    this.respNr,
    this.nr,
    this.lineNr,
    this.userId,
    this.vendorId,
    this.customerId,
    this.partNumber,
    this.title,
    this.partNote,
    this.note,
    this.listPrice,
    this.discountedPrice,
    this.disc,
    this.discRate,
    this.desi,
    this.kg,
    this.cargoPrice,
    this.totalPrice,
    this.vc,
    this.statusId,
    this.ccId,
    this.respStatusId4Vendor,
    this.respStatus4Vendor,
    this.respStatusId4Customer,
    this.respStatus4Customer,
    this.isViewed,
    this.isDisabled,
    this.isAdded2Cart,
    this.media,
    this.vendorInfo,
  });

  final DateTime? date;
  final String? respId;
  final String? reqId;
  final String? reqLineId;
  final String? respLineId;
  final String? respNr;
  final String? nr;
  final int? lineNr;
  final String? userId;
  final String? vendorId;
  final String? customerId;
  final String? partNumber;
  final String? title;
  final String? partNote;
  final dynamic note;
  final int? listPrice;
  final int? discountedPrice;
  final int? disc;
  final double? discRate;
  final double? desi;
  final double? kg;
  final double? cargoPrice;
  final double? totalPrice;
  final int? vc;
  final dynamic statusId;
  final int? ccId;
  final int? respStatusId4Vendor;
  final String? respStatus4Vendor;
  final int? respStatusId4Customer;
  final String? respStatus4Customer;
  final bool? isViewed;
  final bool? isDisabled;
  final bool? isAdded2Cart;
  final Media? media;
  final VendorInfo? vendorInfo;

  factory ResponseList.fromJson(Map<String, dynamic> json) => ResponseList(
        date: DateTime.parse(json["date_"]),
        respId: json["respId"],
        reqId: json["reqId"],
        reqLineId: json["reqLineId"],
        respLineId: json["respLineId"],
        respNr: json["respNr"],
        nr: json["nr"],
        lineNr: json["lineNr"],
        userId: json["userId"],
        vendorId: json["vendorId"],
        customerId: json["customerId"],
        partNumber: json["partNumber"],
        title: json["title"],
        partNote: json["partNote"],
        note: json["note"],
        listPrice: json["listPrice"],
        discountedPrice: json["discountedPrice"],
        disc: json["disc"],
        discRate: json["discRate"].toDouble(),
        desi: json["desi"].toDouble(),
        kg: json["kg"].toDouble(),
        cargoPrice: json["cargoPrice"].toDouble(),
        totalPrice: json["totalPrice"].toDouble(),
        vc: json["vc"],
        statusId: json["statusId"],
        ccId: json["ccId"],
        respStatusId4Vendor: json["respStatusId4Vendor"],
        respStatus4Vendor: json["respStatus4Vendor"],
        respStatusId4Customer: json["respStatusId4Customer"],
        respStatus4Customer: json["respStatus4Customer"],
        isViewed: json["isViewed"],
        isDisabled: json["isDisabled"],
        isAdded2Cart: json["isAdded2Cart"],
        media: Media.fromJson(json["media"]),
        vendorInfo: VendorInfo.fromJson(json["vendorInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "date_": date!.toIso8601String(),
        "respId": respId,
        "reqId": reqId,
        "reqLineId": reqLineId,
        "respLineId": respLineId,
        "respNr": respNr,
        "nr": nr,
        "lineNr": lineNr,
        "userId": userId,
        "vendorId": vendorId,
        "customerId": customerId,
        "partNumber": partNumber,
        "title": title,
        "partNote": partNote,
        "note": note,
        "listPrice": listPrice,
        "discountedPrice": discountedPrice,
        "disc": disc,
        "discRate": discRate,
        "desi": desi,
        "kg": kg,
        "cargoPrice": cargoPrice,
        "totalPrice": totalPrice,
        "vc": vc,
        "statusId": statusId,
        "ccId": ccId,
        "respStatusId4Vendor": respStatusId4Vendor,
        "respStatus4Vendor": respStatus4Vendor,
        "respStatusId4Customer": respStatusId4Customer,
        "respStatus4Customer": respStatus4Customer,
        "isViewed": isViewed,
        "isDisabled": isDisabled,
        "isAdded2Cart": isAdded2Cart,
        "media": media!.toJson(),
        "vendorInfo": vendorInfo!.toJson(),
      };
}

class Media {
  Media({
    this.pictureList,
    this.videoList,
  });

  final List<dynamic>? pictureList;
  final List<dynamic>? videoList;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        pictureList: List<dynamic>.from(json["pictureList"].map((x) => x)),
        videoList: List<dynamic>.from(json["videoList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pictureList": List<dynamic>.from(pictureList!.map((x) => x)),
        "videoList": List<dynamic>.from(videoList!.map((x) => x)),
      };
}

class VendorInfo {
  VendorInfo({
    this.objGuid,
    this.nr,
    this.tableName,
    this.star,
    this.starCount,
  });

  final String? objGuid;
  final int? nr;
  final String? tableName;
  final int? star;
  final int? starCount;

  factory VendorInfo.fromJson(Map<String, dynamic> json) => VendorInfo(
        objGuid: json["objGuid"],
        nr: json["nr"],
        tableName: json["tableName"],
        star: json["star"],
        starCount: json["starCount"],
      );

  Map<String, dynamic> toJson() => {
        "objGuid": objGuid,
        "nr": nr,
        "tableName": tableName,
        "star": star,
        "starCount": starCount,
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
