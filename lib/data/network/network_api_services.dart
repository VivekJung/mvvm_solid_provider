import 'dart:convert';
import 'dart:io';

import 'package:mvm_solid_provider/data/app_exceptions.dart';
import 'package:mvm_solid_provider/data/network/baseApi.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  //socket exception means no internet connection.
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    //post api always contents data.. what data is to be posted
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException();
      case 404:
        throw UnauthorizedException();
      case 500:
      default:
        throw FetchDataException(
            'Error  while communicating with Server with status code ${response.statusCode}');
    }
  }
}
