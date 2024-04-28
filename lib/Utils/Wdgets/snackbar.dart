import 'package:flutter/material.dart';

class SnackBarService {
  static void showSnackBar(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  // static void showSnackBarError(
  //   BuildContext context,
  //   String message,
  // ) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       duration: const Duration(seconds: 3),
  //       content: Text(
  //         message,
  //         style: const TextStyle(color: Colors.white, fontSize: 15),
  //       ),
  //     ),
  //   );
  // }
}
