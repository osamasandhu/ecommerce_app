import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/features/auth/view/sign_in_page.dart';
import 'package:ecommerce_app/src/features/auth/view/sign_up_page.dart';
import 'package:ecommerce_app/src/features/cart/page/cart_page.dart';
import 'package:ecommerce_app/src/features/category/views/categories_page.dart';
import 'package:ecommerce_app/src/features/product/page/product_detail_page.dart';
import 'package:ecommerce_app/src/features/product/page/products_list_page.dart';
import 'package:ecommerce_app/src/routes/app_pages.dart';
import 'package:ecommerce_app/src/widgets/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    errorBuilder: (context, state) {
      return const PageNotFound();
    },
    redirect: (c, s) {
      if (AppData().isSignedIn && s.fullPath == AppPages.signIn.path) {
        debugPrint('signIn true\n');
        return AppPages.category.path;
      }

      if (!AppData().isSignedIn && s.fullPath != AppPages.signIn.path) {
        debugPrint('signIn false\n');

        if (!AppData().isSignedIn && s.fullPath == AppPages.signUp.path) {
          debugPrint('signUp false\n');
          return AppPages.signUp.path;
        }

        return AppPages.signIn.path;
      }

      if (AppData().isSignedIn && s.fullPath == AppPages.signUp.path) {
        debugPrint('signup true\n');
        return AppPages.category.path;
      }

      print('No Condition true\n');
      return null;
    },
    routes: [
      GoRoute(
        path: AppPages.signIn.path,
        name: AppPages.signIn.name,
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
          path: AppPages.signUp.path,
          name: AppPages.signUp.name,
          builder: (_, state) {
            return const SignUpPage();
          }),
      GoRoute(
        path: AppPages.category.path,
        name: AppPages.category.name,
        builder: (_, s) {
          return const CategoriesPage();
        },
      ),
      GoRoute(
        path: AppPages.products.path,
        name: AppPages.products.name,
        builder: (_, state) {
          return ProductsPage(
            categoryName: state.pathParameters['categoryName']!,
          );
        },
      ),
      GoRoute(
        path: AppPages.productDetails.path,
        name: AppPages.productDetails.name,
        builder: (c, state) {
          return ProductDetailPage(
            id: int.parse(state.pathParameters['id']!),
          );
        },
      ),
      GoRoute(
        path: AppPages.cart.path,
        name: AppPages.cart.name,
        builder: (context, state) {
          return const CartPage();
        },
      )
    ],
  );
}
