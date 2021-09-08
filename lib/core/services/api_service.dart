import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'storageUtil.dart';

class ApiService {
  String authorization = StorageUtil.getString("token");

  postMethod(
    Uri url,
    var headers,
    var body,
  ) async {
    final response = await post(url, headers: headers, body: body);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;
      case HttpStatus.unauthorized:
        Logger().e(response);
        break;
    }
  }

  getMethod(
    Uri url,
    var headers,
  ) async {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Error the get request...");
    }
  }
}
