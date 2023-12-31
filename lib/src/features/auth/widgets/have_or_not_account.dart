import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HaveOrNotAccount extends StatefulWidget {
  final String haveText;
  final String authText;
  final VoidCallback onTap;

  const HaveOrNotAccount(
      {Key? key,
      required this.onTap,
      required this.authText,
      required this.haveText})
      : super(key: key);

  @override
  State<HaveOrNotAccount> createState() => _HaveOrNotAccountState();
}

class _HaveOrNotAccountState extends State<HaveOrNotAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: widget.haveText,
            style: GoogleFonts.b612Mono(fontSize: 11,color: Colors.black),
            children: [
              TextSpan(
                  text: widget.authText,
                  style: GoogleFonts.b612Mono(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                    fontSize: 14,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = widget.onTap)
            ],
          ),
        ),
      ),
    );
  }
}
