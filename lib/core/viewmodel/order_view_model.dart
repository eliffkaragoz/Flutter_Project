import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:staj/core/model/order_model/order.dart';
import 'package:staj/core/services/api_service.dart';
import 'package:staj/core/viewmodel/login_view_model.dart';
import 'package:staj/ui/view/order_screen.dart';

class OrderViewModel {
  LoginViewModel loginViewModel = LoginViewModel();
  OrderScreen orderScreen = OrderScreen();
  ApiService apiService = ApiService();

  Future<List<Datum?>?>? fetchOrders() async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({"Page": -, "PageLimit": --}));
    var orderResult = orderFromJson(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return orderResult.data;
      case HttpStatus.unauthorized:
        Logger().e(orderResult);
        break;
    }
    Logger().e(orderResult);
    return Future.error(orderResult);
  }

  getTotalTutar(BuildContext context, index, orderList) {
    double toplam = 0;

    for (int i = 0; i < orderList[index]!.lines!.length; i++) {
      var total = orderList[index]!.lines![i].total;
      toplam = toplam + total!;
    }
    return toplam;
  }
}
