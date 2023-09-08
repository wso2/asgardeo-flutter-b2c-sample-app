import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';

class HTTPClient {

  Future<http.Response> httpGet(String url, String? accessToken) {
    final result = http.get(
      Uri.parse(url),
      headers: {APIClientConstants.authorization: '${APIClientConstants.bearer} $accessToken'},
    );
    return result;
  }

  Future<http.Response> httpPatch(String url, String? accessToken, data){
    final result = http.patch(
      Uri.parse(url),
        headers: {APIClientConstants.authorization: '${APIClientConstants.bearer} $accessToken',
          APIClientConstants.contentType: APIClientConstants.contentTypeJson},
        body: json.encode(data)
    );
    return result;
  }
}
