import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.authorization,
    this.data,
    this.response,
    this.totalRecords,
  });

  final int? authorization;
  final List<Datum>? data;
  final CartResponse? response;
  final int? totalRecords;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        authorization: json["authorization"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        response: CartResponse.fromJson(json["response"]),
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
    this.requestList,
    this.reqCount,
    this.itemCount,
    this.checkedItemCount,
    this.total,
    this.totalDisc,
    this.totalDiscountedPrice,
    this.totalCargo,
    this.totalCargoDisc,
    this.totalCargoDiscountedPrice,
    this.totalServiceFee,
    this.totalServiceFeeDisc,
    this.totalServiceFeeDiscountedPrice,
    this.totalCreditCardFee,
    this.totalCreditCardFeeDisc,
    this.totalCreditCardFeeDiscountedPrice,
    this.cartTotal,
    this.odemeSekli,
  });

  final List<RequestList>? requestList;
  final int? reqCount;
  final int? itemCount;
  final int? checkedItemCount;
  final int? total;
  final int? totalDisc;
  final int? totalDiscountedPrice;
  final double? totalCargo;
  final int? totalCargoDisc;
  final double? totalCargoDiscountedPrice;
  final double? totalServiceFee;
  final double? totalServiceFeeDisc;
  final int? totalServiceFeeDiscountedPrice;
  final int? totalCreditCardFee;
  final int? totalCreditCardFeeDisc;
  final int? totalCreditCardFeeDiscountedPrice;
  final double? cartTotal;
  final dynamic odemeSekli;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        requestList: List<RequestList>.from(
            json["requestList"].map((x) => RequestList.fromJson(x))),
        reqCount: json["reqCount"],
        itemCount: json["itemCount"],
        checkedItemCount: json["checkedItemCount"],
        total: json["total"],
        totalDisc: json["totalDisc"],
        totalDiscountedPrice: json["totalDiscountedPrice"],
        totalCargo: json["totalCargo"].toDouble(),
        totalCargoDisc: json["totalCargoDisc"],
        totalCargoDiscountedPrice: json["totalCargoDiscountedPrice"].toDouble(),
        totalServiceFee: json["totalServiceFee"].toDouble(),
        totalServiceFeeDisc: json["totalServiceFeeDisc"].toDouble(),
        totalServiceFeeDiscountedPrice: json["totalServiceFeeDiscountedPrice"],
        totalCreditCardFee: json["totalCreditCardFee"],
        totalCreditCardFeeDisc: json["totalCreditCardFeeDisc"],
        totalCreditCardFeeDiscountedPrice:
            json["totalCreditCardFeeDiscountedPrice"],
        cartTotal: json["cartTotal"].toDouble(),
        odemeSekli: json["odemeSekli"],
      );

  Map<String, dynamic> toJson() => {
        "requestList": List<dynamic>.from(requestList!.map((x) => x.toJson())),
        "reqCount": reqCount,
        "itemCount": itemCount,
        "checkedItemCount": checkedItemCount,
        "total": total,
        "totalDisc": totalDisc,
        "totalDiscountedPrice": totalDiscountedPrice,
        "totalCargo": totalCargo,
        "totalCargoDisc": totalCargoDisc,
        "totalCargoDiscountedPrice": totalCargoDiscountedPrice,
        "totalServiceFee": totalServiceFee,
        "totalServiceFeeDisc": totalServiceFeeDisc,
        "totalServiceFeeDiscountedPrice": totalServiceFeeDiscountedPrice,
        "totalCreditCardFee": totalCreditCardFee,
        "totalCreditCardFeeDisc": totalCreditCardFeeDisc,
        "totalCreditCardFeeDiscountedPrice": totalCreditCardFeeDiscountedPrice,
        "cartTotal": cartTotal,
        "odemeSekli": odemeSekli,
      };
}

class RequestList {
  RequestList({
    this.reqId,
    this.reqDate,
    this.reqNr,
    this.reqCatText,
    this.reqTitle,
    this.brandLogo,
    this.total,
    this.totalDisc,
    this.totalDiscountedPrice,
    this.totalCargo,
    this.totalCargoDisc,
    this.totalCargoDiscountedPrice,
    this.totalServiceFee,
    this.totalServiceFeeDisc,
    this.totalServiceFeeDiscountedPrice,
    this.totalCreditCardFee,
    this.totalCreditCardFeeDisc,
    this.totalCreditCardFeeDiscountedPrice,
    this.cartTotal,
    this.requestLines,
    this.itemCount,
  });

  final String? reqId;
  final DateTime? reqDate;
  final String? reqNr;
  final String? reqCatText;
  final String? reqTitle;
  final String? brandLogo;
  final int? total;
  final int? totalDisc;
  final int? totalDiscountedPrice;
  final double? totalCargo;
  final int? totalCargoDisc;
  final double? totalCargoDiscountedPrice;
  final double? totalServiceFee;
  final double? totalServiceFeeDisc;
  final int? totalServiceFeeDiscountedPrice;
  final int? totalCreditCardFee;
  final int? totalCreditCardFeeDisc;
  final int? totalCreditCardFeeDiscountedPrice;
  final int? cartTotal;
  final List<RequestLine>? requestLines;
  final int? itemCount;

  factory RequestList.fromJson(Map<String, dynamic> json) => RequestList(
        reqId: json["reqId"],
        reqDate: DateTime.parse(json["reqDate"]),
        reqNr: json["reqNr"],
        reqCatText: json["reqCatText"],
        reqTitle: json["reqTitle"],
        brandLogo: json["brandLogo"],
        total: json["total"],
        totalDisc: json["totalDisc"],
        totalDiscountedPrice: json["totalDiscountedPrice"],
        totalCargo: json["totalCargo"].toDouble(),
        totalCargoDisc: json["totalCargoDisc"],
        totalCargoDiscountedPrice: json["totalCargoDiscountedPrice"].toDouble(),
        totalServiceFee: json["totalServiceFee"].toDouble(),
        totalServiceFeeDisc: json["totalServiceFeeDisc"].toDouble(),
        totalServiceFeeDiscountedPrice: json["totalServiceFeeDiscountedPrice"],
        totalCreditCardFee: json["totalCreditCardFee"],
        totalCreditCardFeeDisc: json["totalCreditCardFeeDisc"],
        totalCreditCardFeeDiscountedPrice:
            json["totalCreditCardFeeDiscountedPrice"],
        cartTotal: json["cartTotal"],
        requestLines: List<RequestLine>.from(
            json["requestLines"].map((x) => RequestLine.fromJson(x))),
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "reqId": reqId,
        "reqDate": reqDate!.toIso8601String(),
        "reqNr": reqNr,
        "reqCatText": reqCatText,
        "reqTitle": reqTitle,
        "brandLogo": brandLogo,
        "total": total,
        "totalDisc": totalDisc,
        "totalDiscountedPrice": totalDiscountedPrice,
        "totalCargo": totalCargo,
        "totalCargoDisc": totalCargoDisc,
        "totalCargoDiscountedPrice": totalCargoDiscountedPrice,
        "totalServiceFee": totalServiceFee,
        "totalServiceFeeDisc": totalServiceFeeDisc,
        "totalServiceFeeDiscountedPrice": totalServiceFeeDiscountedPrice,
        "totalCreditCardFee": totalCreditCardFee,
        "totalCreditCardFeeDisc": totalCreditCardFeeDisc,
        "totalCreditCardFeeDiscountedPrice": totalCreditCardFeeDiscountedPrice,
        "cartTotal": cartTotal,
        "requestLines":
            List<dynamic>.from(requestLines!.map((x) => x.toJson())),
        "itemCount": itemCount,
      };
}

class RequestLine {
  RequestLine({
    this.reqLineId,
    this.reqLineNr,
    this.lineNr,
    this.partNumber,
    this.partTitle,
    this.partNote,
    this.cartItemId,
    this.isChecked,
    this.response,
    this.responseLine,
    this.vendorInfo,
  });

  final String? reqLineId;
  final String? reqLineNr;
  final String? lineNr;
  final dynamic partNumber;
  final String? partTitle;
  final String? partNote;
  final String? cartItemId;
  bool? isChecked;
  final RequestLineResponse? response;
  final ResponseLine? responseLine;
  final VendorInfo? vendorInfo;

  factory RequestLine.fromJson(Map<String, dynamic> json) => RequestLine(
        reqLineId: json["reqLineId"],
        reqLineNr: json["reqLineNr"],
        lineNr: json["lineNr"],
        partNumber: json["partNumber"],
        partTitle: json["partTitle"],
        partNote: json["partNote"],
        cartItemId: json["cartItemId"],
        isChecked: json["isChecked"],
        response: RequestLineResponse.fromJson(json["response"]),
        responseLine: ResponseLine.fromJson(json["responseLine"]),
        vendorInfo: VendorInfo.fromJson(json["vendorInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "reqLineId": reqLineId,
        "reqLineNr": reqLineNr,
        "lineNr": lineNr,
        "partNumber": partNumber,
        "partTitle": partTitle,
        "partNote": partNote,
        "cartItemId": cartItemId,
        "isChecked": isChecked,
        "response": response!.toJson(),
        "responseLine": responseLine!.toJson(),
        "vendorInfo": vendorInfo!.toJson(),
      };
}

class RequestLineResponse {
  RequestLineResponse({
    this.vendorId,
    this.respId,
    this.respDate,
    this.respNr,
  });

  final String? vendorId;
  final String? respId;
  final DateTime? respDate;
  final String? respNr;

  factory RequestLineResponse.fromJson(Map<String, dynamic> json) =>
      RequestLineResponse(
        vendorId: json["vendorId"],
        respId: json["respId"],
        respDate: DateTime.parse(json["respDate"]),
        respNr: json["respNr"],
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "respId": respId,
        "respDate": respDate!.toIso8601String(),
        "respNr": respNr,
      };
}

class ResponseLine {
  ResponseLine({
    this.respLineId,
    this.respLineNr,
    this.respTitle,
    this.respLinePartNumber,
    this.respLinePartNote,
    this.listPrice,
    this.discountedPrice,
    this.disc,
    this.discRate,
    this.desi,
    this.kg,
    this.cargoPrice,
    this.totalPrice,
    this.ccId,
    this.cc,
    this.isRespCancelled,
    this.cargoDisc,
  });

  final String? respLineId;
  final String? respLineNr;
  final String? respTitle;
  final String? respLinePartNumber;
  final String? respLinePartNote;
  final int? listPrice;
  final int? discountedPrice;
  final int? disc;
  final double? discRate;
  final double? desi;
  final double? kg;
  final double? cargoPrice;
  final double? totalPrice;
  final int? ccId;
  final String? cc;
  final bool? isRespCancelled;
  final int? cargoDisc;

  factory ResponseLine.fromJson(Map<String, dynamic> json) => ResponseLine(
        respLineId: json["respLineId"],
        respLineNr: json["respLineNr"],
        respTitle: json["respTitle"],
        respLinePartNumber: json["respLinePartNumber"],
        respLinePartNote: json["respLinePartNote"],
        listPrice: json["listPrice"],
        discountedPrice: json["discountedPrice"],
        disc: json["disc"],
        discRate: json["discRate"].toDouble(),
        desi: json["desi"].toDouble(),
        kg: json["kg"].toDouble(),
        cargoPrice: json["cargoPrice"].toDouble(),
        totalPrice: json["totalPrice"].toDouble(),
        ccId: json["ccId"],
        cc: json["cc"] == null ? null : json["cc"],
        isRespCancelled: json["isRespCancelled"],
        cargoDisc: json["cargoDisc"],
      );

  Map<String, dynamic> toJson() => {
        "respLineId": respLineId,
        "respLineNr": respLineNr,
        "respTitle": respTitle,
        "respLinePartNumber": respLinePartNumber,
        "respLinePartNote": respLinePartNote,
        "listPrice": listPrice,
        "discountedPrice": discountedPrice,
        "disc": disc,
        "discRate": discRate,
        "desi": desi,
        "kg": kg,
        "cargoPrice": cargoPrice,
        "totalPrice": totalPrice,
        "ccId": ccId,
        "cc": cc == null ? null : cc,
        "isRespCancelled": isRespCancelled,
        "cargoDisc": cargoDisc,
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

class CartResponse {
  CartResponse({
    this.result,
    this.resultCode,
    this.resultMsg,
    this.refNumber,
  });

  final bool? result;
  final String? resultCode;
  final String? resultMsg;
  final dynamic refNumber;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
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
