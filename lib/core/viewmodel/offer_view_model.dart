import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:staj/core/model/offer_model/offer.dart';
import 'dart:io';
import 'package:staj/core/services/api_service.dart';

import 'login_view_model.dart';

class OfferViewModel {
  LoginViewModel loginViewModel = LoginViewModel();
  ApiService apiService = ApiService();
  Future<List<Datum?>?>? fetchOffers(String objGuid) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({
          "IncludeResponses": --,
          "ObjGuid": "${--}",
          "Page": --,
          "PageLimit": --,
        }));
    var offersResult = offerFromJson(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return offersResult.data;
      case HttpStatus.unauthorized:
        Logger().e(offersResult);
        break;
    }
    Logger().e(offersResult);
    return Future.error(offersResult);
  }
}
