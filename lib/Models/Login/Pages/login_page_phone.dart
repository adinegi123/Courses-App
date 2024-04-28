import 'package:country_picker/country_picker.dart';
import 'package:elera/Models/Login/Controllers/phone_controller.dart';
import 'package:elera/Models/Signup/Controllers/signuo_landing_controller.dart';
import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:elera/Utils/Wdgets/appbar.dart';
import 'package:elera/Utils/Wdgets/elevate_icon_button.dart';
import 'package:elera/Utils/Wdgets/elevated_button.dart';
import 'package:elera/Utils/Wdgets/snackbar.dart';
import 'package:elera/Utils/Wdgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/Constants/routes.dart';

class LoginInPagePhone extends StatefulWidget {
  const LoginInPagePhone({Key? key}) : super(key: key);

  @override
  State<LoginInPagePhone> createState() => _LoginInPagePhoneState();
}

class _LoginInPagePhoneState extends State<LoginInPagePhone> {
  bool value = false;

  bool otp = false;
  String countryCode = "91";

  PhoneController controller = Get.put(PhoneController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Obx(() {
            bool isLoading = controller.isLoading.value;
            debugPrint(isLoading.toString());
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(height: 150),
                  _body(),
                  // const SizedBox(height: 30),
                  // const Spacer(),
                  // _footer(),
                ]);
          }),
        ),
      ),
    );
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(Images.loginFrame),
          Row(
            children: const [
              Text(
                "Login to your Account",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                  child: MyTextFormField(
                hintText: "+$countryCode",
                readOnly: true,
                onTap: () {
                  showCountryPicker(
                      context: context,
                      favorite: <String>['IN'],
                      showPhoneCode: true,
                      onSelect: (c) {
                        setState(() {
                          countryCode = c.phoneCode;
                          controller.codeController.text = c.phoneCode;
                        });
                      });
                },
              )),
              const SizedBox(width: 5),
              Expanded(
                  flex: 3,
                  child: MyTextFormField(
                    controller: controller.phoneNumberController,
                    hintText: "Phone",
                    keyboardType: TextInputType.phone,
                  )),
            ],
          ),
          // MyTextFiledPhone(
          //   hintText: "Phone",
          //   countryCodePickerValue: (phone) {
          //     controller.phoneNumberController.text = phone.completeNumber;
          //   },
          //   keyboardType: TextInputType.phone,
          // ),
          // const SizedBox(height: 20),
          // controller.otp.value
          //     ? FilledRoundedPinPut(controller: controller.otpController)
          //     : Container(),
          const SizedBox(height: 50),
          MyElevatedButton(
            isLoading: controller.isLoading.value,
            label: "Send OTP",
            onPressed: () {
              if (controller.phoneNumberController.text.isEmpty ||
                  controller.phoneNumberController.text.length < 10) {
                SnackBarService.showSnackBar(
                    context, "Pease Entre correct mobile number");
              } else {
                if (controller.codeController.text.isEmpty) {
                  controller.codeController.text = "91";
                }
                controller.phonenumber =
                    "+${controller.codeController.text}${controller.phoneNumberController.text}";
                controller.sendOtp();
                Get.toNamed(RoutesName.otpVerificationPage,
                    arguments: controller.phonenumber);
                // controller.otp.value == false
                //     ? controller.sendOtp()
                //     : controller.verifyOtp();
              }
              // if (_formKey.currentState!.validate()) {
              //
              // }
            },
          ),
          // const SizedBox(height: 10),
          // MyElevatedButton(
          //   label: "Login with email",
          //   onPressed: () {
          //     Get.toNamed(RoutesName.loginInPageEmail);
          //   },
          // ),
          // const SizedBox(height: 20),
          //   controller.otp.value == false
          //       ? Container()
          //       : Text(
          //           "Didn't recive otp, Send again!",
          //           style: TextStyle(color: ColorConst.buttonColor),
          //         ),
          //   const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _divider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("or"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _footer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GetBuilder<SignupLandingController>(
            init: SignupLandingController(),
            initState: (_) {},
            builder: (controller) {
              return MyTextIconButton(
                label: "Continue with Google",
                icon: SvgPicture.asset(
                  Images.svgGoogle,
                  color: Colors.white,
                ),
                primary: Colors.red,
                onPressed: () => controller.googleSignIn(),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(color: ColorConst.greyTextColor),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () => Get.offAndToNamed(RoutesName.signUpPage),
                child: Text(
                  "Sign up",
                  style: TextStyle(color: ColorConst.buttonColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _socialButtons({
    Widget? social1,
    Widget? social2,
    Widget? social3,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: social1,
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: social2,
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: social3,
        ),
      ],
    );
  }
}
