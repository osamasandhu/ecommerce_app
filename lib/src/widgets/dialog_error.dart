import 'package:ecommerce_app/src/shared/dio_error.dart';
import 'package:ecommerce_app/src/widgets/data_loading.dart';
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

              Navigator.of(context).pop();

              // AppNavigation.pop(context);
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
