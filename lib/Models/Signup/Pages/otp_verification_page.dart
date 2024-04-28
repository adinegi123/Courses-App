import 'package:elera/Models/Login/Controllers/phone_controller.dart';
import 'package:elera/Models/Login/Widgets/otp_fields.dart';
import 'package:elera/Models/Signup/Controllers/signuo_landing_controller.dart';
import 'package:elera/Utils/Wdgets/appbar.dart';
import 'package:elera/Utils/Wdgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({Key? key}) : super(key: key);
  PhoneController controller = PhoneController();
  SignupLandingController signupcontroller = SignupLandingController();
  var phone = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: "Confirm Otp"),
        body: Obx(() {
          controller.phoneNumberController.text = phone ?? "";
          signupcontroller.phoneNumberController.text = phone ?? "";
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "OTP is been sent to your registered phone number, Please entre OTP to verify",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  FilledRoundedPinPut(controller: controller.otpController),
                  const SizedBox(height: 80),
                  MyElevatedButton(
                    isLoading: controller.isLoading.value,
                    label: "Confirm",
                    onPressed: () {
                      controller.verifyOtp();
                    },
                  )
                ],
              ),
            ),
          );
        }));
  }
}
