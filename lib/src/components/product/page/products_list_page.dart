import 'package:ecommerce_app/src/components/cart/widgets/cart.dart';
import 'package:ecommerce_app/src/components/product/page/product_detail_page.dart';
import 'package:ecommerce_app/src/components/product/provider/future/future_provider.dart';
import 'package:ecommerce_app/src/route/nav.dart';
import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:ecommerce_app/src/widgets/no_record.dart';
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
              padding: const EdgeInsets.all(20),
              itemBuilder: (c, i) {
                return GestureDetector(
                  onTap: () {
                    AppNavigation.push(
                        context,
                        ProductDetailPage(
                          productModel: product[i],
                        ));
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
                          child: Image.network(
                            product[i].image,
                            fit: BoxFit.fill,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product[i].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "\$${product[i].price.toString()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.yellowAccent, size: 18),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${product[i].rating.rate.toString()} (${product[i].rating.count.toString()} )",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
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
