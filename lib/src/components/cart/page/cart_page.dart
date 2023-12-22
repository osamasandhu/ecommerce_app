import 'package:ecommerce_app/src/base/app_data.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/components/product/provider/count_provider.dart';
import 'package:ecommerce_app/src/utils/nav.dart';
import 'package:ecommerce_app/src/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  List<CartModel> cart = [];

  @override
  void initState() {
    super.initState();
    cart = AppData().getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    // final cartCount = ref.watch(cartCounterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.isEmpty
          ? const NoRecordWidget()
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (c, i) {
                return GestureDetector(
                  onTap: () {},
                  onDoubleTap: () {
                    circularProgressWidget(context);
                    Future.delayed(const Duration(seconds: 2), () {
                      cart.removeAt(i);
                      AppData().itemDelete(i);
                      setState(() {});

                      AppNavigation.pop(context);
                      ref.read(cartCounterProvider.notifier).dec();

                    });
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    color: Colors.black.withOpacity(0.7),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.network(cart[i].image,
                              fit: BoxFit.fill, height: 70, width: 70),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  cart[i].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                radius: 13,
                                child: Text(
                                  cart[i].quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (c, i) {
                return const SizedBox(height: 20);
              },
              itemCount: cart.length,
            ),
    );
  }
}

// class CartPage extends ConsumerWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartData = ref.watch(getCartItemsProvider(2));
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//       ),
//       body: cartData.when(data: (cart) {
//         if (cart.isEmpty) {
//           return const NoRecordWidget();
//         } else {
//           return ListView.separated(
//               padding: const EdgeInsets.all(20),
//               itemBuilder: (c, i) {
//                 return Material(
//                   borderRadius: BorderRadius.circular(10),
//                   elevation: 6,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       children: [
//                         RowData(
//                             title: cart[i].userId.toString(), head: "User ID"),
//                         RowData(
//                             title: cart[i].products[i].productId.toString(),
//                             head: "Product ID"),
//                         RowData(
//                             title: cart[i].products[i].quantity.toString(),
//                             head: "Quantity"),
//                         RowData(title: cart[i].date.toString(), head: "Date"),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (c, i) {
//                 return const SizedBox(height: 20);
//               },
//               itemCount: cart.length);
//         }
//       }, error: (error, e) {
//         return const Text('data');
//       }, loading: () {
//         return const DataLoading();
//       }),
//     );
//   }
// }

class RowData extends StatelessWidget {
  final String head;
  final String title;

  const RowData({super.key, required this.title, required this.head});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(head), subtitle: Text(title));
  }
}
