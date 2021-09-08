import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:staj/core/model/listAddress_model/listAddress.dart';
import 'package:staj/core/model/userInfo_model/userInfo_model.dart';

import 'package:staj/core/services/api_service.dart';

class AccountInformationViewModel {
  ApiService apiService = ApiService();

  Future<List<Datum>?> fetchUserInfo() async {
    var response = await ApiService().getMethod(Uri.parse("Your APİ URL"), {
      "Content-type": "application/json",
      "Authorization": "${apiService.authorization}"
    });
    var userInfoResult = userInfoFromJson(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return userInfoResult.data;
    }
    Logger().e(userInfoResult);
    return Future.error(userInfoResult);
  }

  Future<List<Data?>?>? fetchAllAddresses() async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({}));
    var listAddressResult = listAddressFromJson(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return listAddressResult.data;
      case HttpStatus.unauthorized:
        Logger().e(listAddressResult);
        break;
    }
    Logger().e(listAddressResult);
    return Future.error(listAddressResult);
  }
}
