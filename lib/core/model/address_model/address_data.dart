class Datum {
  Datum({
    this.cityid,
    this.name,
    this.code,
  });

  final int? cityid;
  final String? name;
  final String? code;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cityid: json["cityid"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "cityid": cityid,
        "name": name,
        "code": code,
      };
}
