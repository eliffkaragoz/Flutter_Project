import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:staj/core/model/login_model/login.dart';
import 'package:staj/core/services/api_service.dart';
import 'package:staj/core/viewmodel/offer_view_model.dart';
import 'package:staj/ui/view/login_screen.dart';

class LoginViewModel {
  Future<List<Datum?>?> fetchLoginInformation(
      String email, String password) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
        },
        jsonEncode({"model": "--", "password": --, "userName": --}));
    Login claimsResult = loginFromJson(response.body);

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
