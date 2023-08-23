import 'dart:async';

import 'package:my_flutter_boilerplate/data/app_exception.dart';
import 'package:my_flutter_boilerplate/data/network/base_api_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
//*..................................GET API....................................

  @override
  Future getApi({
    required String url,
  }) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 15));

      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimout();
    }
    return responseJson;
  }

  returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJsn = jsonDecode(response.body);

        return responseJsn;

      case 400:
        throw InvalidUrlException(response.body);
      case 401:
        throw InvalidTokenException(response.body);
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            "Error while communicating  : ${response.statusCode.toString()}");
    }
  }
}
