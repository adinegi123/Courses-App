import 'dart:io';

import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static String baseUrl = "https://livedivine.in/api/";

  static Future post({required String key, required Map body}) async {
    var response = await client.post(Uri.parse(baseUrl + key), body: body);
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }

  static Future get({required String key}) async {
    var response = await client.post(Uri.parse(baseUrl + key));

    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      return null;
    }
  }

  static Future multipart({
    required String key,
    required Map<String, String> body,
    required File file,
  }) async {
    try {
      var stream = http.ByteStream(Stream.castFrom(file.openRead()));
      var length = await file.length();

      var request = http.MultipartRequest("POST", Uri.parse(baseUrl + key));

      var multipartFileSign =
          http.MultipartFile('user_image', stream, length, filename: file.path);
      request.files.add(multipartFileSign);
      request.headers.addAll({"Content-Type": "multipart/form-data;"});
      request.fields.addAll(body);
      var response = await request.send();
      var data = await response.stream.bytesToString();
      return data;
    } catch (e) {
      SnackBarService.showSnackBar(Get.context!, "Something whent wrong");
    }
  }
}
