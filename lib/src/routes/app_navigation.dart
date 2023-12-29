import 'package:ecommerce_app/src/routes/app_router.dart';
import 'package:ecommerce_app/src/routes/app_pages.dart';
import 'package:flutter/foundation.dart';

class AppNavigation {
  AppNavigation._();

  static void to(
    AppPages page, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    if (kIsWeb) {
      go(
        page,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    } else {
      push(
        page,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  static void go(
    AppPages page, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    AppRouter.router.goNamed(
      page.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void push(
    AppPages page, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    AppRouter.router.pushNamed(
      page.name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static bool get canPop => AppRouter.router.canPop();

  static void pop() {
    if (!canPop) return;
    AppRouter.router.pop();
  }
}
