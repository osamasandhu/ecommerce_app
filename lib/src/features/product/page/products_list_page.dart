import 'package:ecommerce_app/src/features/cart/widgets/cart.dart';
import 'package:ecommerce_app/src/features/product/provider/future/future_provider.dart';
import 'package:ecommerce_app/src/routes/app_navigation.dart';
import 'package:ecommerce_app/src/routes/app_pages.dart';
import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:ecommerce_app/src/widgets/network_image.dart';
import 'package:ecommerce_app/src/widgets/no_record.dart';
import 'package:ecommerce_app/src/widgets/rating_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  final String categoryName;

  const ProductsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(getProductsProvider(categoryName));

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        actions: const [CartWidget()],
      ),
      body: productList.when(
        data: (product) {
          if (product.isEmpty) {
            return const NoRecordWidget();
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (c, i) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    AppNavigation.to(
                      AppPages.productDetails,
                      pathParameters: {'id': product[i].id.toString()},
                    ); // context.pushNamed(
                    //   AppRoute.productDetail,
                    //   pathParameters: {'id': product[i].id.toString()},
                    //   extra: product[i],
                    // );
                    // context.goNamed(
                    //   AppRoute.productDetail,
                    //   pathParameters: {'id': product[i].id.toString()},
                    //   // extra: product[i],
                    // );
                  },
                  child:Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 8,
                    color: Colors.black.withOpacity(0.7),
                    //
                    child: Row(
                      children: [
                        AppNetworkImageWidget(url: product[i].image),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product[i].title,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "\$${product[i].price.toString()}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ),
                              RatingWidget(
                                count: product[i].rating.count,
                                rating: product[i].rating.rate,
                                color: Colors.white,
                              ),
                              // Row(
                              //   children: [
                              //     const Icon(Icons.star,
                              //         color: Colors.yellowAccent, size: 16),
                              //     const SizedBox(width: 5),
                              //     Text(
                              //       "${product[i].rating.rate.toString()} (${product[i].rating.count.toString()} )",
                              //       style: const TextStyle(
                              //         fontSize: 10,
                              //         color: Colors.white,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (c, i) {
                return const SizedBox(height: 15);
              },
              itemCount: product.length,
            );
          }
        },
        error: (error, e) {
          return Text(error.toString());
        },
        loading: () {
          return const DataLoading();
        },
      ),
    );
  }
}
