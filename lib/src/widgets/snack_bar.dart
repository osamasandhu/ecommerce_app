import 'package:flutter/material.dart';

class AppSnackBar {
  static snackBarWidget({
    required BuildContext context,
    String? title,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title??"Cart is Empty",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(120),
        ),
        margin: const EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? Colors.red,
      ),
    );
  }
}
