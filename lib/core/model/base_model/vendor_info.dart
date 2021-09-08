import 'package:staj/core/model/base_model/enumvalues.dart';

enum Status { SIPARI_GNDERILDI, SIPARI }

final statusValues = EnumValues({
  "Sipariş": Status.SIPARI,
  "\u000d\nSipariş Gönderildi": Status.SIPARI_GNDERILDI
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
