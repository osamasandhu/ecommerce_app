import 'dart:async';

import 'package:ecommerce_app/src/widgets/dialog_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reusables/reusables.dart';

class DefaultAwaiterBehaviour extends AwaiterBehaviour<String> {
  const DefaultAwaiterBehaviour();

  @override
  void after(BuildContext context) => Navigator.of(context).pop();

  @override
  Future<FutureOr<void>> before(
      BuildContext context,
      String arguments,
      ) async {
    circularProgressWidget(context);
  }
}