// import 'package:elera/Models/Signup/Controllers/signuo_landing_controller.dart';
// import 'package:elera/Utils/Constants/constants_colors.dart';
// import 'package:elera/Utils/Constants/routes.dart';
// import 'package:elera/Utils/Wdgets/elevated_button.dart';
// import 'package:elera/Utils/Wdgets/elevate_icon_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import '../../../Utils/Constants/constans_assets.dart';

// class SignupLandingPage extends StatelessWidget {
//   const SignupLandingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 100),
//               _header(),
//               const SizedBox(height: 60),
//               _body(),
//               const SizedBox(height: 60),
//               _footer(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _header() {
//     return Column(
//       children: [
//         Image.asset(Images.loginFrame),
//         const SizedBox(height: 20),
//         const Text(
//           "Let's you in",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _body() {
//     return Column(
//       children: [
//         // const MyTextIconButton(
//         //   label: "Continue with Facebook",
//         //   icon: Icon(Icons.facebook, color: Colors.blue),
//         // ),
//         GetBuilder<SignupLandingController>(
//           init: SignupLandingController(),
//           initState: (_) {},
//           builder: (controller) {
//             return MyTextIconButton(
//               label: "Continue with Google",
//               icon: SvgPicture.asset(Images.svgGoogle),
//               onPressed: () => controller.googleSignIn(),
//             );
//           },
//         ),
//         // MyTextIconButton(
//         //   label: "Continue with Gmail",
//         //   icon: SvgPicture.asset(
//         //     Images.svgGmail,
//         //     height: 20,
//         //   ),
//         // ),
//       ],
//     );
//   }

//   Widget _footer(context) {
//     return Column(
//       children: [
//         _divider(),
//         const SizedBox(height: 30),
//         MyElevatedButton(
//           label: "Sign in with phone",
//           onPressed: () => Get.toNamed(RoutesName.loginInPagePhone),
//         ),
//         const SizedBox(height: 30),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Don't have an account?",
//               style: TextStyle(color: ColorConst.greyTextColor),
//             ),
//             const SizedBox(width: 5),
//             GestureDetector(
//               onTap: () => Get.toNamed(RoutesName.signUpPage),
//               child: Text(
//                 "Sign up",
//                 style: TextStyle(color: ColorConst.buttonColor),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   Widget _divider() {
//     return Row(
//       children: const [
//         Expanded(child: Divider()),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Text("or"),
//         ),
//         Expanded(child: Divider()),
//       ],
//     );
//   }
// }
