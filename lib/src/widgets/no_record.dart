import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:flutter/material.dart';

class NoRecordWidget extends StatelessWidget {
  const NoRecordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Record found',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}