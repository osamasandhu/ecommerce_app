import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:flutter/material.dart';

class DataLoading extends StatelessWidget {
  final Color? color;

  const DataLoading({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        strokeWidth: 2.5,
      ),
    );
  }
}
