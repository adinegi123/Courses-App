import 'package:elera/Models/Login/Pages/login_page_gmail.dart';
import 'package:elera/Models/Onboarding%20Screen/Pages/onboarding_screen.dart';
import 'package:elera/Models/Signup/Pages/otp_verification_page.dart';
import 'package:elera/Models/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

import '../../Models/Account Setup/Pages/register_page.dart';
import '../../Models/Login/Pages/login_page_phone.dart';
import '../../Models/Signup/Pages/signup_page.dart';
import '../BottomNavigation/bottom_navigation.dart';

class Routes {
  static List<GetPage<dynamic>>? pages = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const Splashscreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: RoutesName.onboardingPages,
      page: () => const OnboardScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
        name: RoutesName.loginInPagePhone,
        page: () => const LoginInPagePhone()),
    GetPage(
        name: RoutesName.loginInPageEmail,
        page: () => const LoginInPageGmail()),
    GetPage(name: RoutesName.signUpPage, page: () => const SignUpPage()),
    GetPage(
        name: RoutesName.bottomNavigation,
        page: () => BottomNavigation(),
        transition: Transition.cupertino),
    GetPage(name: RoutesName.registerPage, page: () => const RegisterPage()),
    GetPage(
        name: RoutesName.otpVerificationPage,
        page: () => OtpVerificationPage()),
  ];
}

class RoutesName {

  //storage const
  static String token = "token";

  //routes const
  static String splashScreen = "/SplashScreen";
  static String onboardingPages = "/OnboardingPages";
  static String signupLandingPage = "/SignupLandingPage";
  static String loginInPagePhone = "/LoginInPagePhone";
  static String loginInPageEmail = "/LoginInPageEmail";
  static String signUpPage = "/SignUpPage";
  static String bottomNavigation = "/BottomNavigationController";
  static String registerPage = "/RegisterPage";
  static String otpVerificationPage = "/OtpVerificationPage";
}
