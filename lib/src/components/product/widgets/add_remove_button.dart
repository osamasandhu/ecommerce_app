import 'package:flutter/material.dart';

class AddRemoveButtonWidget extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;

  final Color? color;

  const AddRemoveButtonWidget({
    super.key,
    this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: color ?? Colors.red,
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(
        icon ?? Icons.remove,
        color: Colors.white,
        size: 14,
      ),
    );
  }
}
