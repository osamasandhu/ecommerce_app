import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                  text: widget.authText,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = widget.onTap)
            ],
          ),
        ),
      ),
    );
  }
}
