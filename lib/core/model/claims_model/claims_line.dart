import 'package:staj/core/model/base_model/enumvalues.dart';

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
    this.statusId,
    this.status,
    this.rc,
    this.unReadRc,
    this.vc,
    this.minPrice,
    this.maxPrice,
    this.avgPrice,
    this.isViewed,
    this.isDisabled,
    this.isVendorResponded,
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
  final int? statusId;
  final Status? status;
  final int? rc;
  final int? unReadRc;
  final int? vc;
  final double? minPrice;
  final double? maxPrice;
  final double? avgPrice;
  final bool? isViewed;
  final bool? isDisabled;
  final bool? isVendorResponded;
  final bool? isVendorOrdered;
  final List<dynamic>? responseList;
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
        statusId: json["statusId"],
        status: statusValues.map![json["status"]],
        rc: json["rc"],
        unReadRc: json["unReadRc"],
        vc: json["vc"],
        minPrice: json["minPrice"].toDouble(),
        maxPrice: json["maxPrice"].toDouble(),
        avgPrice: json["avgPrice"].toDouble(),
        isViewed: json["isViewed"],
        isDisabled: json["isDisabled"],
        isVendorResponded: json["isVendorResponded"],
        isVendorOrdered: json["isVendorOrdered"],
        responseList: List<dynamic>.from(json["responseList"].map((x) => x)),
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
        "statusId": statusId,
        "status": statusValues.reverse![status],
        "rc": rc,
        "unReadRc": unReadRc,
        "vc": vc,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "avgPrice": avgPrice,
        "isViewed": isViewed,
        "isDisabled": isDisabled,
        "isVendorResponded": isVendorResponded,
        "isVendorOrdered": isVendorOrdered,
        "responseList": List<dynamic>.from(responseList!.map((x) => x)),
        "orderLines": List<dynamic>.from(orderLines!.map((x) => x)),
      };
}

enum Status { YENI, SEPETE_EKLENDI }

final statusValues =
    EnumValues({"Sepete Eklendi": Status.SEPETE_EKLENDI, "Yeni": Status.YENI});
