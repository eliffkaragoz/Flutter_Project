import 'package:staj/core/model/base_model/media.dart';
import 'package:staj/core/model/claims_model/address.dart';
import 'package:staj/core/model/claims_model/claims_line.dart';

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
