import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? title;
  final Widget? leading;
  final double height;
  final double? elevation;
  final Color? backgroundColor, titleColor, statusBarColor;
  final Brightness? statusBarIconBrightness;
  final bool? centerTitle;
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    this.titleName,
    this.title,
    this.leading,
    this.height = kToolbarHeight,
    this.elevation = 0.0,
    this.backgroundColor,
    this.titleColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      centerTitle: centerTitle,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
            color: backgroundColor == Colors.transparent
                ? Theme.of(context).iconTheme.color
                : Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
      title: Text(
        title ?? "",
        style: const TextStyle(color: Colors.black),
      ),
      actions: actions,
    );
  }
}
