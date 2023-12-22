import 'package:ecommerce_app/src/utils/color.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static loadingDialog() {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 110,
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.primaryColor),
            const Spacer(),
            const Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
