import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/services/rest_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../product/model/product_model.dart';

part 'future_provider.g.dart';

final appApiProvider = Provider((ref) => AppApi());

@riverpod
Future<List<ProductModel>> getProducts(GetProductsRef ref, String category) {
  return ref.read(appApiProvider).getProducts(category);
}

@Riverpod(keepAlive: true)
Future<List<String>> getCategories(GetCategoriesRef ref) {
  return ref.read(appApiProvider).getCategories();
}

@riverpod
Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) {
  return ref.read(appApiProvider).getCartList(userId);
}
