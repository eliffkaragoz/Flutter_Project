import 'dart:convert';
import 'package:logger/logger.dart';
import 'dart:io';
import 'package:staj/core/model/claims_model/claims.dart';
import 'package:staj/core/model/claims_model/claims_data.dart';
import 'package:staj/core/services/api_service.dart';

class ClaimViewModel {
  ApiService apiService = ApiService();

  Future<List<Datum?>?> fetchClaims() async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({
          "Page": -,
          "PageLimit": -,
          "StatusList": [-]
        }));
    Claims claimsResult = claimsFromJson(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return claimsResult.data;
      case HttpStatus.unauthorized:
        Logger().e(claimsResult);
        break;
    }
    Logger().e(claimsResult);
    return Future.error(claimsResult);
  }
}
