import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/features/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/features/cart/provider/cart_provider.dart';
import 'package:ecommerce_app/src/widgets/decorated_container.dart';

import 'package:ecommerce_app/src/widgets/dialog_error.dart';

import 'package:ecommerce_app/src/widgets/network_image.dart';

import 'package:ecommerce_app/src/widgets/no_record.dart';

import 'package:ecommerce_app/src/widgets/snack_bar.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.isEmpty
          ? const NoRecordWidget()
          : ListView.separated(
              padding: const EdgeInsets.all(15),
              itemBuilder: (c, i) {
                return DecoratedContainerWidget(
                  onLongPress: () async {
                    await deleteItemDialog(i: i);
                    // if (cart.isEmpty) {
                    //   print(AppData().isSignedIn);
                    //   AppData().setToken('');
                    //   print(AppData().isSignedIn);
                    //   setState(() {});
                    // }
                  },
                  child: Row(
                    children: [
                      AppNetworkImageWidget(url: cart[i].image),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                cart[i].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                            const SizedBox(width: 10),
                            CircleAvatar(
                              radius: 12,
                              child: Text(
                                cart[i].quantity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10)
                    ],
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

  Future deleteItemDialog({required int i}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Are you sure you want to delete ${cart[i].title}?",
            style: const TextStyle(fontSize: 12),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                circularProgressWidget(context);
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // AppNavigation.pop(context);
                  // AppNavigation.pop(context);
                  AppSnackBar.snackBarWidget(
                    context: context,
                    title: '${cart[i].title} removed from cart successfully',
                  );

                  ///Removed from List
                  cart.removeAt(i);

                  ///Removed from Local Storage
                  AppData().itemDelete(i);
                  setState(() {});
                  ref.read(cartCounterProvider.notifier).dec();
                });
              },
            ),
          ],
        );
      },
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
