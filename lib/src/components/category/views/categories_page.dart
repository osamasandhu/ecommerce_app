import 'package:ecommerce_app/src/components/cart/widgets/cart.dart';
import 'package:ecommerce_app/src/components/category/provider/future_provider.dart';
import 'package:ecommerce_app/src/helpers/color.dart';
import 'package:ecommerce_app/src/helpers/route_names.dart';
import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:ecommerce_app/src/widgets/no_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
            return LayoutBuilder(builder: (context, constraint) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraint.maxWidth < 550
                      ? 2
                      : constraint.maxWidth < 880
                          ? 4
                          : 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: category.length,
                itemBuilder: (c, i) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      context.pushNamed(AppRoute.productList,
                          pathParameters: {'categoryName': category[i]});
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor,
                      elevation: 8,
                      child: Center(
                        child: Text(
                          category[i],
                          style: const TextStyle(
                            color: Colors.white,fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              );
            });
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
