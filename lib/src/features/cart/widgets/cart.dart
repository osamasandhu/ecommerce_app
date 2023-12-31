import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/features/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/src/routes/app_navigation.dart';
import 'package:ecommerce_app/src/routes/app_pages.dart';
import 'package:ecommerce_app/src/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartCounterProvider);

    return IconButton(
      onPressed: () {
        print(AppData().isSignedIn);
        AppData().getCartProducts().isNotEmpty
            ? AppNavigation.to(AppPages.cart)
            // context.pushNamed(AppRoute.cart)
            // ? context.goNamed(AppRoute.cart)
            : AppSnackBar.snackBarWidget(
                context: context,
              );
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart),
          Positioned(
            left: AppData().getCartProducts().length > 9 ? -7 : -6,
            top: AppData().getCartProducts().length > 9 ? -7 : -6,
            child: count == 0
                ? const SizedBox()
                : Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      count.toInt().toString(),
                      style: TextStyle(
                          fontSize:
                              AppData().getCartProducts().length > 9 ? 8 : 10),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
