import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double opacity = 0;
  double opacity0 = 0;
  final box = GetStorage();

  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      setState(() {
        opacity = 1;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          opacity0 = 1;
        });
      }).then((value) {
        String? token = box.read(RoutesName.token);
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAndToNamed(token == null
              ? RoutesName.onboardingPages
              : RoutesName.bottomNavigation);
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 6),
            child: Center(
                child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                Images.logo,
                // height: 200,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Center(
                child: AnimatedOpacity(
              opacity: opacity0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                Images.logo0,
                // height: 200,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
