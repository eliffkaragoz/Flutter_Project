// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Datum>? data;
  final Response? response;
  final int? totalRecords;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
    this.orderId,
    this.nr,
    this.reqId,
    this.customerId,
    this.date,
    this.title,
    this.catText,
    this.total,
    this.brandLogo,
    this.statusId,
    this.status,
    this.lines,
  });

  final String? orderId;
  final String? nr;
  final String? reqId;
  final String? customerId;
  final DateTime? date;
  final String? title;
  final String? catText;
  final double? total;
  final String? brandLogo;
  final int? statusId;
  final dynamic status;
  final List<Line>? lines;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["orderId"],
        nr: json["nr"],
        reqId: json["reqId"],
        customerId: json["customerId"],
        date: DateTime.parse(json["date_"]),
        title: json["title"],
        catText: json["catText"],
        total: json["total"].toDouble(),
        brandLogo: json["brandLogo"],
        statusId: json["statusId"],
        status: json["status"],
        lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "nr": nr,
        "reqId": reqId,
        "customerId": customerId,
        "date_": date!.toIso8601String(),
        "title": title,
        "catText": catText,
        "total": total,
        "brandLogo": brandLogo,
        "statusId": statusId,
        "status": status,
        "lines": List<dynamic>.from(lines!.map((x) => x.toJson())),
      };
}

class Line {
  Line({
    this.reqId,
    this.date,
    this.title,
    this.catText,
    this.reqLineId,
    this.nr,
    this.partNote,
    this.partNumber,
    this.partTitle,
    this.desi,
    this.kg,
    this.orderId,
    this.orderLineId,
    this.orderNr,
    this.cargoPrice,
    this.ccId,
    this.disc,
    this.discountedPrice,
    this.discRate,
    this.listPrice,
    this.total,
    this.statusId,
    this.status,
    this.respId,
    this.respLineId,
    this.customerId,
    this.vendorId,
    this.shipTrackNr,
    this.cc,
    this.isReturnable,
    this.shipTime,
    this.deliveryTime,
    this.isViewed,
    this.cargoTrackUrl,
    this.media,
    this.returnInfo,
    this.paymentInfo,
    this.vendorInfo,
  });

  final String? reqId;
  final DateTime? date;
  final String? title;
  final String? catText;
  final String? reqLineId;
  final String? nr;
  final String? partNote;
  final dynamic partNumber;
  final String? partTitle;
  final double? desi;
  final double? kg;
  final String? orderId;
  final String? orderLineId;
  final String? orderNr;
  final double? cargoPrice;
  final int? ccId;
  final double? disc;
  final double? discountedPrice;
  final double? discRate;
  final int? listPrice;
  final double? total;
  final int? statusId;
  final String? status;
  final String? respId;
  final String? respLineId;
  final String? customerId;
  final String? vendorId;
  final String? shipTrackNr;
  final Cc? cc;
  final bool? isReturnable;
  final DateTime? shipTime;
  final DateTime? deliveryTime;
  final bool? isViewed;
  final String? cargoTrackUrl;
  final Media? media;
  final dynamic returnInfo;
  final dynamic paymentInfo;
  final VendorInfo? vendorInfo;

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        reqId: json["reqId"],
        date: DateTime.parse(json["date_"]),
        title: json["title"],
        catText: json["catText"],
        reqLineId: json["reqLineId"],
        nr: json["nr"],
        partNote: json["partNote"],
        partNumber: json["partNumber"],
        partTitle: json["partTitle"],
        desi: json["desi"].toDouble(),
        kg: json["kg"].toDouble(),
        orderId: json["orderId"],
        orderLineId: json["orderLineId"],
        orderNr: json["orderNr"],
        cargoPrice: json["cargoPrice"].toDouble(),
        ccId: json["ccId"],
        disc: json["disc"].toDouble(),
        discountedPrice: json["discountedPrice"].toDouble(),
        discRate: json["discRate"].toDouble(),
        listPrice: json["listPrice"],
        total: json["total"].toDouble(),
        statusId: json["statusId"],
        status: json["status"],
        respId: json["respId"],
        respLineId: json["respLineId"],
        customerId: json["customerId"],
        vendorId: json["vendorId"],
        shipTrackNr: json["shipTrackNr"] == null ? null : json["shipTrackNr"],
        cc: ccValues.map![json["cc"]],
        isReturnable: json["isReturnable"],
        shipTime: DateTime.parse(json["shipTime"]),
        deliveryTime: DateTime.parse(json["deliveryTime"]),
        isViewed: json["isViewed"],
        cargoTrackUrl:
            json["cargoTrackUrl"] == null ? null : json["cargoTrackUrl"],
        media: Media.fromJson(json["media"]),
        returnInfo: json["returnInfo"],
        paymentInfo: json["paymentInfo"],
        vendorInfo: VendorInfo.fromJson(json["vendorInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "reqId": reqId,
        "date_": date!.toIso8601String(),
        "title": title,
        "catText": catText,
        "reqLineId": reqLineId,
        "nr": nr,
        "partNote": partNote,
        "partNumber": partNumber,
        "partTitle": partTitle,
        "desi": desi,
        "kg": kg,
        "orderId": orderId,
        "orderLineId": orderLineId,
        "orderNr": orderNr,
        "cargoPrice": cargoPrice,
        "ccId": ccId,
        "disc": disc,
        "discountedPrice": discountedPrice,
        "discRate": discRate,
        "listPrice": listPrice,
        "total": total,
        "statusId": statusId,
        "status": status,
        "respId": respId,
        "respLineId": respLineId,
        "customerId": customerId,
        "vendorId": vendorId,
        "shipTrackNr": shipTrackNr == null ? null : shipTrackNr,
        "cc": ccValues.reverse![cc],
        "isReturnable": isReturnable,
        "shipTime": shipTime!.toIso8601String(),
        "deliveryTime": deliveryTime!.toIso8601String(),
        "isViewed": isViewed,
        "cargoTrackUrl": cargoTrackUrl == null ? null : cargoTrackUrl,
        "media": media!.toJson(),
        "returnInfo": returnInfo,
        "paymentInfo": paymentInfo,
        "vendorInfo": vendorInfo!.toJson(),
      };
}

enum Cc { PTT, YURT }

final ccValues = EnumValues({"PTT": Cc.PTT, "YURTİÇİ": Cc.YURT});

class Media {
  Media({
    this.pictureList,
    this.videoList,
  });

  final List<PictureList>? pictureList;
  final List<dynamic>? videoList;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        pictureList: List<PictureList>.from(
            json["pictureList"].map((x) => pictureListValues.map![x])),
        videoList: List<dynamic>.from(json["videoList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pictureList": List<dynamic>.from(
            pictureList!.map((x) => pictureListValues.reverse![x])),
        "videoList": List<dynamic>.from(videoList!.map((x) => x)),
      };
}

enum PictureList {
  EFB3_D109_A41_A_4_C59_825_C_38_E98_E069843_PNG,
  THE_933_F9853_1_D41_4778_A039_751_E4_DBDB10_C_PNG,
  THE_816_B707_C_B19_A_4_AF4_825314_C819070573_PNG
}

final pictureListValues = EnumValues({
  "efb3d109-a41a-4c59-825c-38e98e069843.png":
      PictureList.EFB3_D109_A41_A_4_C59_825_C_38_E98_E069843_PNG,
  "816b707c-b19a-4af4-8253-14c819070573.png":
      PictureList.THE_816_B707_C_B19_A_4_AF4_825314_C819070573_PNG,
  "933f9853-1d41-4778-a039-751e4dbdb10c.png":
      PictureList.THE_933_F9853_1_D41_4778_A039_751_E4_DBDB10_C_PNG
});

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
  final TableName? tableName;
  final int? star;
  final int? starCount;

  factory VendorInfo.fromJson(Map<String, dynamic> json) => VendorInfo(
        objGuid: json["objGuid"],
        nr: json["nr"],
        tableName: tableNameValues.map![json["tableName"]],
        star: json["star"],
        starCount: json["starCount"],
      );

  Map<String, dynamic> toJson() => {
        "objGuid": objGuid,
        "nr": nr,
        "tableName": tableNameValues.reverse![tableName],
        "star": star,
        "starCount": starCount,
      };
}

enum TableName { GEN_PARA, DKKAN_AD }

final tableNameValues = EnumValues(
    {"Dükkan Adı": TableName.DKKAN_AD, "GENÇ PARÇA": TableName.GEN_PARA});

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
