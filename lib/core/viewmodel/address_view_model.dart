import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:staj/core/model/address_model/city.dart';
import 'package:staj/core/model/address_model/address_data.dart';
import 'package:staj/core/model/createAddress_model.dart';
import 'package:staj/core/services/api_service.dart';

class AddressViewModel {
  ApiService apiService = ApiService();

  Future<List<Datum>?> fetchCities() async {
    var response = await ApiService().getMethod(Uri.parse("Your APİ URL"), {
      "Content-type": "application/json",
      "Authorization": "${apiService.authorization}"
    });
    City cityResult = cityFromJson(response.body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return cityResult.data;
    }
    Logger().e(cityResult);
    return Future.error(cityResult);
  }

  Future<List<Datum>?> fetchDistricts(String cityID) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
        },
        jsonEncode({"id": cityID}));
    var districtsResult = cityFromJson(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return districtsResult.data;
    }
    Logger().e(districtsResult);
    return Future.error(districtsResult);
  }

  Future<List<CreateAddressResponse>?> createAddress(
      String address1,
      String addressTitle,
      String city,
      int cityId,
      String email,
      String invoiceAddressTypId,
      String name,
      String surname,
      String tckNo,
      String telNo,
      String town,
      int townID,
      int typId) async {
    var response = await ApiService().postMethod(
        Uri.parse("Your APİ URL"),
        {
          "Content-type": "application/json",
          "Authorization": "${apiService.authorization}"
        },
        jsonEncode({
          "address1": address1,
          "address2": null,
          "addressTitle": addressTitle,
          "city": city,
          "cityId": cityId,
          "email": email,
          "fax": null,
          "invoiceAddressTypId": invoiceAddressTypId,
          "name": name,
          "objGuid": null,
          "surname": surname,
          "taxNr": null,
          "taxOffice": null,
          "tckNo": tckNo,
          "tel": telNo,
          "town": town,
          "townId": townID,
          "typId": typId,
          "typIdCache": [
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            "1"
          ]
        }));
    var createAddressResult = createAddressFromJson(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return createAddressResult.data;
    }
    Logger().e(createAddressResult);
    return Future.error(createAddressResult);
  }
}
