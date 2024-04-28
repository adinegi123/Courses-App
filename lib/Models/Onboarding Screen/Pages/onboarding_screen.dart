import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<OnBoardModel> onBoardData = [
    OnBoardModel(
      title: '',
      description: "We provide the best learning courses and great mentors!",
      imgUrl: Images.onboard1,
    ),
    OnBoardModel(
      title: '',
      description: "Learn anytime and anywhere easily and conveniently",
      imgUrl: Images.onboard2,
    ),
    OnBoardModel(
      title: "",
      description: "Lets improve your skills together with Elera right now!",
      imgUrl: Images.onboard3,
    ),
  ];
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnBoard(
      pageController: _pageController,
      onBoardData: onBoardData,
      imageHeight: 300,
      imageWidth: 250,
      curve: Curves.easeInOutSine,
      duration: const Duration(milliseconds: 500),
      onSkip: () {
        Get.offAndToNamed(RoutesName.loginInPageEmail);
      },
      descriptionStyles: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
      pageIndicatorStyle: const PageIndicatorStyle(
        width: 50,
        inactiveColor: Colors.grey,
        activeColor: Colors.blue,
        inactiveSize: Size(8, 8),
        activeSize: Size(11, 11),
      ),
      nextButton: OnBoardConsumer(
        builder: (context, ref, child) {
          final state = ref.watch(onBoardStateProvider);
          return InkWell(
            onTap: () => _onNextTap(state),
            child: Container(
              margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
              child: Text(
                state.isLastPage ? "Done" : "Next",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    ));
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
      );
    } else {
      Get.offAndToNamed(RoutesName.loginInPageEmail);
    }
  }
}
