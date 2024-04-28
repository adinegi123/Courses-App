import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:flutter/material.dart';

class MyTextIconButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color? primary;
  final void Function()? onPressed;
  const MyTextIconButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.primary = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextButton.icon(
              onPressed: onPressed,
              icon: icon,
              label: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: TextButton.styleFrom(
                  elevation: 0,
                  side: BorderSide(color: ColorConst.border),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // primary: Colors.red,
                  backgroundColor: primary),
            ),
          ),
        ),
      ],
    );
  }
}
