class Address {
  Address({
    this.id,
    this.text,
  });

  final String? id;
  final String? text;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "text": text == null ? null : text,
      };
}
