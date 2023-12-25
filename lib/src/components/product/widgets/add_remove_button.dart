import 'package:flutter/material.dart';

class AddRemoveButtonWidget extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;

  final Color? color;

  const AddRemoveButtonWidget({super.key, this.icon, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // borderRadius: BorderRadius.circular(120),
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: color ?? Colors.red,
        minimumSize: const Size(50, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360),
        ),
      ),
      child: Icon(
        icon ?? Icons.remove,
        color: Colors.white,
      ),
    );
  }
}
