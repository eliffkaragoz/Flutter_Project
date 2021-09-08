import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:staj/core/model/cart_model/cart.dart';
import 'package:staj/core/model/cart_model/status_cart.dart';
import 'package:staj/core/services/api_service.dart';
import 'package:staj/core/viewmodel/login_view_model.dart';
import 'package:staj/ui/view/login_screen.dart';

class CartViewModel {
  ApiService apiService = ApiService();
  LoginScreen loginScreen = LoginScreen();
  LoginViewModel loginViewModel = LoginViewModel();
  Future<List<Datum?>?>? fetchCart() async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({}));
    Cart claimsResult = cartFromJson(response.body);

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

  Future<List<Response?>?>? fetchCheckStatus(
      bool isChecked, String objGuid) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({
          "isChecked": --,
          "ObjGuid": "${--}",
        }));
    var offersResult = checkStatusFromJson(response.body);
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

  Future<List<Response?>?>? removeFromCart(
      bool isChecked, String objGuid) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({
          "isChecked": --,
          "ObjGuid": "--",
        }));
    var offersResult = checkStatusFromJson(response.body);
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
