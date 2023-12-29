import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/helpers/default_behavior.dart';
import 'package:ecommerce_app/src/routes/app_router.dart';
import 'package:ecommerce_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusables/reusables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Awaiter.defaultBehaviour = const DefaultAwaiterBehaviour();
  await AppData().initilize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
