// ignore_for_file: must_be_immutable

import 'package:elera/Models/Courses/Pages/course_page.dart';
import 'package:elera/Models/Home/Pages/home_page.dart';
import 'package:elera/Models/Inbox/Pages/inbox_page.dart';
import 'package:elera/Models/Profile/Pages/profile_page.dart';
import 'package:elera/Models/Transaction/Pages/transaction_page.dart';
import 'package:elera/Utils/BottomNavigation/controller.dart';
import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:elera/Utils/Wdgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int index =  controller.tabIndex.toInt();
      return Scaffold(
        drawer: const MyDrawer(),
        body: IndexedStack(
          index: index,
          children: const [
            HomePage(),
            CoursePage(),
            InboxPage(),
            TransactionPage(),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConst.buttonColor,
          currentIndex: index,
          onTap: (index) => controller.changeTabIndex(index),
          type: BottomNavigationBarType.fixed,
          items: [
            bottomBar(
                icon: SvgPicture.asset(
                  Images.svgHome,
                  color: controller.tabIndex == 0
                      ? ColorConst.buttonColor
                      : Colors.grey.shade500,
                ),
                lable: "Home"),
            bottomBar(
                icon: SvgPicture.asset(
                  Images.svgDoc,
                  color: controller.tabIndex == 1
                      ? ColorConst.buttonColor
                      : Colors.grey.shade500,
                ),
                lable: "My Course"),
            bottomBar(
                icon: SvgPicture.asset(
                  Images.svgChat,
                  color: controller.tabIndex == 2
                      ? ColorConst.buttonColor
                      : Colors.grey.shade500,
                ),
                lable: "Inbox"),
            bottomBar(
                icon: SvgPicture.asset(
                  Images.svgBuy,
                  color: controller.tabIndex == 3
                      ? ColorConst.buttonColor
                      : Colors.grey.shade500,
                ),
                lable: "Transaction"),
            bottomBar(
                icon: SvgPicture.asset(
                  Images.svgProfile,
                  color: controller.tabIndex == 4
                      ? ColorConst.buttonColor
                      : Colors.grey.shade500,
                ),
                lable: "Profile"),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem bottomBar({required Widget icon, String? lable}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: lable,
    );
  }
}
