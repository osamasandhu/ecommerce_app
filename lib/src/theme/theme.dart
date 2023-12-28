import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: false,
      textTheme: GoogleFonts.b612MonoTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.b612Mono(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 6,

          ///foregroundColor is used to change the color of text
          foregroundColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: GoogleFonts.b612Mono(
            ///Not Working
            ///Color is not changed
            // color: Colors.deepOrange,
            fontSize: 15,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
