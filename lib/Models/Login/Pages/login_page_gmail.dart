import 'package:elera/Models/Login/Controllers/email_login_controller.dart';
import 'package:elera/Models/Signup/Controllers/signuo_landing_controller.dart';
import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:elera/Utils/Wdgets/elevate_icon_button.dart';
import 'package:elera/Utils/Wdgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/Wdgets/textfield.dart';

class LoginInPageGmail extends StatefulWidget {
  const LoginInPageGmail({Key? key}) : super(key: key);

  @override
  State<LoginInPageGmail> createState() => _LoginInPageGmailState();
}

class _LoginInPageGmailState extends State<LoginInPageGmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = false;

  bool value = false;
  EmailLoginController controller = Get.put(EmailLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          controller.isLoading.value;
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  const SizedBox(height: 60),
                  _body(),
                  // _footer(),
                ]),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(Images.loginFrame),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          MyTextFormField(
            controller: controller.emailController,
            hintText: "Email",
            prefixIcon: SvgPicture.asset(Images.svgEmail),
            validator: (v) {
              if (v!.isEmpty) {
                return "Required Field";
              } else if (!v.isEmail) {
                return "Enter correct email id";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          MyTextFormField(
            controller: controller.passwordController,
            hintText: "Password",
            obscureText: obscureText,
            prefixIcon: SvgPicture.asset(Images.svgLock),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                obscureText = !obscureText;
              }),
              icon: obscureText == true
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            validator: (v) {
              if (v!.isEmpty) {
                return "Required Field";
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create an account?",
                  style: TextStyle(color: ColorConst.greyTextColor),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: ColorConst.buttonColor),
                  ),
                  onTap: () => Get.toNamed(RoutesName.signUpPage),
                ),
              ],
            ),
            Text(
              "Forgot the password?",
              style: TextStyle(color: ColorConst.buttonColor),
            ),
          ]),
          const SizedBox(height: 20),
          MyElevatedButton(
            label: "Sign in",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.emailLogin();
              }
            },
          ),
          const SizedBox(height: 20),
          MyElevatedButton(
            label: "Login with Mobile",
            onPressed: () {
              Get.toNamed(RoutesName.loginInPagePhone);
            },
          ),
          const SizedBox(height: 20),
          _divider(),
          const SizedBox(height: 20),
          GetBuilder<SignupLandingController>(
            init: SignupLandingController(),
            initState: (_) {},
            builder: (controller) {
              return MyTextIconButton(
                label: "Continue with Google",
                icon: SvgPicture.asset(Images.svgGoogle, color: Colors.white),
                primary: Colors.red,
                onPressed: () => controller.googleSignIn(),
              );
            },
          ),
          // const SizedBox(height: 20),
          // Text(
          //   "Forgot the password?",
          //   style: TextStyle(color: ColorConst.buttonColor),
          // ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Row(
      children: const [
        Expanded(
            child: Divider(
          thickness: 2,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("or"),
        ),
        Expanded(
            child: Divider(
          thickness: 2,
        )),
      ],
    );
  }

  Widget _footer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(color: ColorConst.greyTextColor),
          ),
          const SizedBox(width: 5),
          Text(
            "Sign up",
            style: TextStyle(color: ColorConst.buttonColor),
          ),
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
