import 'package:ecommerce_app/src/utils/color.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  final String? hintText;
  final String? label;

  final IconData? prefixIcon;
  final bool floatLabel;

  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
class AppPasswordField extends StatefulWidget {
  final String? hint;

  final BuildContext? context;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? textEditingController;

  const AppPasswordField(
      {Key? key,
        this.validator,
        this.hint,
        this.context,
        this.textEditingController // this.validator,
      })
      : super(key: key);

  @override
  _AppPasswordFieldState createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _show,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        style: const TextStyle(
          color: Colors.black,
        ),
        scrollPadding: const EdgeInsets.all(180),
        decoration: InputDecoration(
          // labelStyle: const TextStyle(color: primaryColor),
          hintText: widget.hint,
          suffixIcon: IconButton(
            icon: Icon(
              _show ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () => setState(() => _show = !_show),
          ),
        ),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}