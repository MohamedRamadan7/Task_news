// ignore_for_file: avoid_print

import 'dart:io';

import 'package:http/http.dart';

import '../res/res_api_names.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class HttpHelper {
  static Future<Response> getReq(
    String endPoint, {
    Map<String, String>? headers,
  }) async {
    print("\x1B[32m -=-=-=-=-= $baseUrl$endPoint =-=-=-=-=-");
    headers = {'Accept': 'application/json'}..addAll(headers ?? {});
    Response response = await get(
      Uri.parse(baseUrl + endPoint),
      headers: headers,
    );
    print(response.statusCode == 200
        ? "\x1B[32m ${response.body}"
        : "\x1B[31m ${response.body}");
    return response;
  }

  static Future<Response> postReq(
    String endPoint, {
    required body,
    Map<String, String>? headers,
    bool fullURL = false,
  }) async {
    print(
        "\x1B[32m -=-=-=-=-= ${fullURL ? endPoint : baseUrl + endPoint} =-=-=-=-=-");
    headers = {'Accept': 'application/json'}..addAll(headers ?? {});
    Response response = await post(
      Uri.parse(fullURL ? endPoint : baseUrl + endPoint),
      body: body,
      headers: headers,
    );
    print(response.statusCode == 200
        ? "\x1B[32m ${response.body}"
        : "\x1B[31m ${response.body}");
    return response;
  }

  static Future<Response> putReq(
    String endPoint, {
    required Object body,
    required String token,
  }) async {
    print("\x1B[32m -=-=-=-=-= $baseUrl$endPoint =-=-=-=-=-");
    Response response = await put(
      Uri.parse(baseUrl + endPoint),
      body: body,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode == 200
        ? "\x1B[32m ${response.body}"
        : "\x1B[31m ${response.body}");
    return response;
  }
}
