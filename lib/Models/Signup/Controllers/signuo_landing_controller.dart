import 'package:elera/Models/Login/Model/phonenumber_model.dart';
import 'package:elera/Models/Signup/Model/social_login_model.dart';
import 'package:elera/Service/service.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupLandingController extends GetxController {
  var isLoading = false.obs;
  var isConfirm = "".obs;
  String phonenumber = "";

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  void signup() async {
    isLoading(true);
    if (codeController.text.isEmpty) {
      codeController.text = "91";
    }
    Map body = {
      'email': emailController.text,
      'password': passwordController.text,
      "mobile": phonenumber,
    };
    try {
      var data = await ApiService.post(key: "register_user", body: body);
      var res = phoneNumberModelFromJson(data);
      if (res.statusCode == 200) {
        Get.toNamed(RoutesName.otpVerificationPage, arguments: phonenumber);
        SnackBarService.showSnackBar(Get.context!, res.data.toString());
        debugPrint(res.data.toString());
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

  googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await socialLogin(email: googleUser.email, socialId: googleUser.id);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future socialLogin({required String email, required String socialId}) async {
    isLoading(true);
    Map body = {
      'email': email,
      'social_type': '1',
      "social_id": socialId,
    };
    try {
      var data = await ApiService.post(key: "social_login", body: body);
      var res = socialLoginModelFromJson(data);
      if (res.statusCode == 200) {
        GetStorage().write(RoutesName.token, res.data!.token);
        Get.offAndToNamed(RoutesName.bottomNavigation);
        debugPrint(res.data.toString());
        isLoading(false);
      } else {
        isLoading(false);
        SnackBarService.showSnackBar(Get.context!, res.message);
      }
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }
}
