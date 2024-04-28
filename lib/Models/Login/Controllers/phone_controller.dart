import 'dart:convert';

import 'package:elera/Models/Login/Model/otp_model.dart';
import 'package:elera/Models/Login/Model/phonenumber_model.dart';
import 'package:elera/Service/service.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PhoneController extends GetxController {
  var isLoading = false.obs;
  var otp = false.obs;
  var verificationCode = "".obs;
  String phonenumber = "";

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  void sendOtp() async {
    isLoading(true);
    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    String? token = await firebaseMessaging.getToken();
    // if (codeController.text.isEmpty) {
    //   codeController.text = "91";
    // }
    Map body = {
      "mobile": phonenumber,
      'device_token': token,
      'device_type': '0'
    };
    try {
      var data = await ApiService.post(key: "user_login", body: body);
      var res = phoneNumberModelFromJson(data);
      if (res.statusCode == 200) {
        SnackBarService.showSnackBar(Get.context!, res.data.toString());
        debugPrint(res.data.toString());
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

  void verifyOtp() async {
    isLoading(true);
    // if (codeController.text.isEmpty) {
    //   codeController.text = "91";
    // }
    Map body = {
      "mobile": Get.arguments,
      "otp": otpController.text,
    };
    try {
      var data = await ApiService.post(key: "verify_opt", body: body);
      // debugPrint(res.data.toString());
      var resData = json.decode(data);
      var res = ProfileModel.fromJson(resData);
      if (res.statusCode == 200) {
        GetStorage().write(RoutesName.token, res.data!.token);
        Get.offAndToNamed(RoutesName.bottomNavigation);
        isLoading(false);
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
