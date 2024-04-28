import 'dart:convert';
import 'dart:io';
import 'package:elera/Service/service.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var otp = false.obs;
  var verificationCode = "".obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void registerUser(File? file) async {
    isLoading(true);
    Map<String, String> body = {
      "full_name": nameController.text,
      "password": passwordController.text,
      "email": emailController.text,
      "mobile": "+91${mobileController.text}",
    };
    try {
      var data = await ApiService.multipart(
          key: "register_user", body: body, file: file!);
      debugPrint(data);
      var res = json.decode(data);
      if (res["statusCode"] == 200) {
        Get.toNamed(RoutesName.bottomNavigation);
        SnackBarService.showSnackBar(Get.context!, res["message"]);
      } else {
        SnackBarService.showSnackBar(Get.context!, res["message"]);
      }
      isLoading(false);
    } catch (e) {
      debugPrint(e.toString());
      isLoading(false);
    }
  }
}
