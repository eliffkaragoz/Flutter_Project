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
