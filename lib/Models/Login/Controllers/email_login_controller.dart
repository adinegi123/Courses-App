import 'dart:convert';

import 'package:elera/Models/Login/Model/otp_model.dart';
import 'package:elera/Service/service.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmailLoginController extends GetxController {
  var isLoading = false.obs;
  final box = GetStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emailLogin() async {
    Map body = {
      "email": emailController.text,
      'password': passwordController.text,
    };

    try {
      var data = await ApiService.post(key: "Signin", body: body);
      var res = ProfileModel.fromJson(data);
      if (res.statusCode == 200) {
        box.write(RoutesName.token, res.data!.token);
        SnackBarService.showSnackBar(Get.context!, res.message!);
        Get.offAndToNamed(RoutesName.bottomNavigation);
        isLoading(false);
        // update();
      } else {
        isLoading(false);
        SnackBarService.showSnackBar(Get.context!, res.message!);
      }
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }
}
