import 'package:flutter/material.dart';

class DecoratedContainerWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const DecoratedContainerWidget(
      {super.key, this.onLongPress, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onLongPress: onLongPress,
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8,
        color: Colors.black.withOpacity(0.7),
        child: child,
      ),
    );
  }
}
