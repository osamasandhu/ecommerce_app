import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/components/cart/page/cart_page.dart';
import 'package:ecommerce_app/src/components/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/src/route/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartCounterProvider);

    return IconButton(
      onPressed: () {
        AppData().isSignedIn
            ? AppNavigation.push(context, const CartPage())
            : ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Persmision Required'),
          ),
        );
      },
      icon: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart),
          Positioned(
            left: -3,
            top: 0,
            child: count == 0
                ? const SizedBox()
                : Container(
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
              padding: const EdgeInsets.all(4),
              child: Text(
                count.toInt().toString(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
