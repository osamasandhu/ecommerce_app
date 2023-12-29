import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/components/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/src/components/cart/widgets/cart.dart';
import 'package:ecommerce_app/src/components/product/model/product_model.dart';
import 'package:ecommerce_app/src/components/product/provider/count/count_product_provider.dart';
import 'package:ecommerce_app/src/components/product/provider/future/future_provider.dart';
import 'package:ecommerce_app/src/components/product/widgets/add_remove_row.dart';
import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:ecommerce_app/src/route/nav.dart';
import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:ecommerce_app/src/widgets/dialog_error.dart';
import 'package:ecommerce_app/src/widgets/rating_count_widget.dart';
import 'package:ecommerce_app/src/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {
  final int id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(counterValueProvider);
    final productDetail = ref.watch(getSingleProductProvider(id));

    return Scaffold(
      appBar: AppBar(
        actions: const [CartWidget()],
        elevation: 0,
      ),
      body: productDetail.when(
        data: (product) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(product.image,
                      height: MediaQuery.of(context).size.height / 3.4),
                ),
                const Divider(),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Price : \$${product.price.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    trailing: RatingWidget(
                      count: product.rating.count,
                      rating: product.rating.rate,
                    )),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                AddRemoveRow(
                  itemCount: itemCount,
                  ref: ref,
                  context: context,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _onTap(
                      context: context,
                      product: product,
                      ref: ref,
                      itemCount: itemCount,
                    );
                  },
                  child: const Text(
                    'Add to cart',
                  ),
                )
              ],
            ),
          );
        },
        error: (error, e) {
          return Text(error.toString());
        },
        loading: () => const DataLoading(),
      ),
    );
  }

  void _onTap({
    required BuildContext context,
    required ProductModel product,
    required WidgetRef ref,
    required int itemCount,
  }) async {
    List<CartModel> cartModel = AppData().getCartProducts();

    var cartProduct = cartModel.where((element) => element.productId == id);
    if (cartModel.isNotEmpty &&
        cartProduct.isNotEmpty &&
        cartProduct.first.productId == id) {
      AppSnackBar.snackBarWidget(
        context: context,
        title: '${product.title} already added in cart',
      );
    } else {
      circularProgressWidget(context);
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          AppData().addValueToCart(
            CartModel(
              userId: 1,
              date: DateTime.now(),
              productId: product.id,
              quantity: itemCount,
              title: product.title,
              image: product.image,
            ),
          );

          AppNavigation.pop(context);
          ref.read(cartCounterProvider.notifier).inc();

          AppSnackBar.snackBarWidget(
            context: context,
            title: '${product.title} added to cart',
            color: Colors.green,
          );
        },
      );

      AppData().setToken('Cart is not Empty');
    }
  }
}
