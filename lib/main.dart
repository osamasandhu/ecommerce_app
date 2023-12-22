import 'package:ecommerce_app/src/base/app_data.dart';
import 'package:ecommerce_app/src/components/auth/pages/sign_in_page.dart';
import 'package:ecommerce_app/src/components/category/page/categories_page.dart';
import 'package:ecommerce_app/src/utils/default_behavior.dart';
import 'package:ecommerce_app/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusables/reusables.dart';

void main() async {
  Awaiter.defaultBehaviour = const DefaultAwaiterBehaviour();
  await AppData().initilize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const SignInPage(),
    );
  }
}
