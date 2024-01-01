import 'package:ecommerce_app/src/features/category/api/category_api/category_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'future_provider.g.dart';

final _appApiProvider = Provider((ref) => CategoryApi());


@Riverpod(keepAlive: true)
Future<List<String>> getCategories(GetCategoriesRef ref) {
  return ref.read(_appApiProvider).getCategories();
}

// @riverpod
// Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) {
//   return ref.read(appApiProvider).getCartList(userId);
// }
