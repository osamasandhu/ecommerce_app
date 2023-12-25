import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/components/cart/mixing/cart_mixing.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/components/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/src/components/cart/widgets/cart.dart';
import 'package:ecommerce_app/src/components/product/model/product_model.dart';
import 'package:ecommerce_app/src/components/product/provider/count/count_product_provider.dart';
import 'package:ecommerce_app/src/components/product/widgets/add_remove_button.dart';
import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:ecommerce_app/src/route/nav.dart';
import 'package:ecommerce_app/src/widgets/dialog_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPage extends ConsumerStatefulWidget with CartProductMixing {
  final ProductModel productModel;

  const ProductDetailPage({super.key, required this.productModel});

  @override
  ConsumerState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterValueProvider);
    // final cartCount = ref.watch(cartCounterProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const [CartWidget()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(widget.productModel.image,
                  height: MediaQuery.of(context).size.height / 3.4),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.productModel.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                widget.productModel.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 22,
                  ),
                  const SizedBox(width: 5),
                  Text(
                      "${widget.productModel.rating.rate.toString()} (${widget.productModel.rating.count.toString()} )")
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                widget.productModel.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddRemoveButtonWidget(
                  onTap: () {
                    if (count > 1) {
                      ref.read(counterValueProvider.notifier).decrement();
                    }
                  },
                ),
                SizedBox(
                  width: 35,
                  child: Text(
                    count.toInt().toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                AddRemoveButtonWidget(
                  onTap: () {
                    ref.read(counterValueProvider.notifier).increment();
                  },
                  color: Colors.green,
                  icon: Icons.add,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                circularProgressWidget(context);
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () {
                    AppData().addValueToCart(
                      CartModel(
                        userId: 1,
                        date: DateTime.now(),
                        productId: widget.productModel.id,
                        quantity: count,
                        title: widget.productModel.title,
                        image: widget.productModel.image,
                        // products: [
                        //   CartProductsModel(
                        //     productId: widget.productModel.id,
                        //     quantity: count,
                        //   ),
                        // ],
                      ),
                    );

                    AppNavigation.pop(context);
                    ref.read(cartCounterProvider.notifier).inc();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('1 item added to cart'),
                      ),
                    );
                  },
                );

                AppData().setToken('Token add');
                // print(AppData().getToken());
              },
              // onPressed: () => onSubmitCart(count),
              child: const Text('Add to cart'),
            )
          ],
        ),
      ),
    );
  }

// onSubmitCart(int count) async {
//   try {
//     await Awaiter.process(
//       future: AppApi().addCartProduct(
//         CartModel(
//           userId: 1,
//           date: DateTime.now(),
//           products: [
//             CartProductsModel(
//               productId: widget.productModel.id,
//               quantity: count,
//             ),
//           ],
//         ),
//       ),
//       context: context,
//       arguments: 'Loading',
//     );
//   } catch (e) {
//     print(e.toString());
//     showDioError(context, e);
//   }
// }

// class ProductDetailPage extends ConsumerWidget {
//   final ProductModel productModel;
//
//   const ProductDetailPage({super.key, required this.productModel});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final count = ref.watch(counterValueProvider);
//
//     return Scaffold(
//       // extendBodyBehindAppBar: true,
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(
//                 productModel.image,
//                 height: MediaQuery.of(context).size.height / 3.4,
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: Text(
//                 productModel.title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               subtitle: Text(
//                 productModel.price.toString(),
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primaryColor),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 22,
//                   ),
//                   const SizedBox(width: 5),
//                   Text(
//                       "${productModel.rating.rate.toString()} (${productModel.rating.count.toString()} )")
//                 ],
//               ),
//             ),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 productModel.description,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w100,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildButton(
//                   onTap: () {
//                     ref.read(counterValueProvider.notifier).decrement();
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(count.toInt().toString()),
//                 ),
//                 _buildButton(
//                   onTap: () {
//                     ref.read(counterValueProvider.notifier).increment();
//                   },
//                   color: Colors.green,
//                   icon: Icons.add,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await Awaiter.process(
//                     future: AppApi().addCartProduct(
//                       CartModel(
//                         userId: 1,
//                         date: DateTime.now(),
//                         products: [
//                           CartProductsModel(
//                             productId: productModel.id,
//                             quantity: count,
//                           ),
//                         ],
//                       ),
//                     ),
//                     context: context,
//                     arguments: 'Loading',
//                   );
//                 } catch (e) {
//                   print(e.toString());
//                   showDioError(context, e);
//                 }
//               },
//               child: const Text('Add to cart'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButton(
//       {IconData? icon, required VoidCallback onTap, Color? color}) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(120),
//       onTap: onTap,
//       child: CircleAvatar(
//         backgroundColor: color ?? Colors.red,
//         child: Icon(
//           icon ?? Icons.remove,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
}

