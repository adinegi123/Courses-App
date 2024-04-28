import 'package:elera/Utils/Constants/constans_assets.dart';
import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        // margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: ColorConst.buttonColor,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40))),
        width: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          children: [
            const SizedBox(height: 25),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/person.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              "Andrew Ainsley",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            drawerItems(
                svg: Images.svgHome,
                title: "Home",
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                }),
            drawerItems(
              svg: Images.svgDoc,
              title: "My Cources",
              onTap: () => Get.offNamed("/BottomNavigationController",
                  arguments: 1, preventDuplicates: false),
            ),
            drawerItems(
              svg: Images.svgChat,
              title: "Chats",
              onTap: () => Get.offNamed("/BottomNavigationController",
                  arguments: 2, preventDuplicates: false),
            ),
            drawerItems(
              svg: Images.svgBuy,
              title: "Transactions",
              onTap: () => Get.offNamed("/BottomNavigationController",
                  arguments: 3, preventDuplicates: false),
            ),
            drawerItems(
              svg: Images.svgProfile,
              title: "Profile",
              onTap: () => Get.offNamed("/BottomNavigationController",
                  arguments: 4, preventDuplicates: false),
            ),
            drawerItems(svg: Images.svgBookmark, title: "Bookmarks"),
            drawerItems(svg: Images.svgNotification, title: "Notifications"),
          ],
        ),
      ),
    );
  }

  Widget drawerItems(
      {String? svg, required String title, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            svg == null
                ? Container()
                : SvgPicture.asset(
                    svg,
                    color: Colors.white,
                  ),
            // icon == null
            //     ? Container()
            //     : Icon(
            //         icon,
            //         color: Colors.white,
            //       ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
