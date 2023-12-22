import 'package:ecommerce_app/src/services/dio_error.dart';
import 'package:ecommerce_app/src/utils/color.dart';
import 'package:ecommerce_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

circularProgressWidget(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext c) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const DataLoading(),
      );
    },
  );
}

showDioError(BuildContext context, var e) {
  DialogError error;
  if (e is! DialogError) {
    error = DialogError.withDioError(e);
  } else {
    error = e;
  }

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext c) {
      return AlertDialog(
        title: error.title.isEmpty ? null : Text(error.title),
        content: Text(error.description),
        actions: [
          TextButton(
            onPressed: () {
              AppNavigation.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    },
  );
}

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
