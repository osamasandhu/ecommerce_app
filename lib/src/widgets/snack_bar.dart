import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSnackBar {
  static snackBarWidget({
    required BuildContext context,
    String? title,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          title ?? "The shopping cart currently contains no items.",
          textAlign: TextAlign.center,
          style: GoogleFonts.b612Mono(fontSize: 9),
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
