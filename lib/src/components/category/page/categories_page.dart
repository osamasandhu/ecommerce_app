import 'package:ecommerce_app/src/base/app_data.dart';
import 'package:ecommerce_app/src/components/cart/page/cart_page.dart';
import 'package:ecommerce_app/src/components/category/provider/future_provider.dart';
import 'package:ecommerce_app/src/components/product/page/product_detail_page.dart';
import 'package:ecommerce_app/src/components/product/page/products_list_page.dart';
import 'package:ecommerce_app/src/utils/color.dart';
import 'package:ecommerce_app/src/utils/nav.dart';
import 'package:ecommerce_app/src/widgets/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesData = ref.watch(getCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: const [
          CartWidget(),
        ],
      ),
      body: categoriesData.when(
        data: (category) {
          //print(category);
          if (category.isEmpty) {
            return const NoRecordWidget();
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: category.length,
              itemBuilder: (c, i) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    AppNavigation.push(
                        context, ProductsPage(categoryName: category[i]));
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                    elevation: 8,
                    child: Center(
                      child: Text(
                        category[i],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
        error: (error, e) {
          return null;
        },
        loading: () {
          return const DataLoading();
        },
      ),
    );
  }
}
