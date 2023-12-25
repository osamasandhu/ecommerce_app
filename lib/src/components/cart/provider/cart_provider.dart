import 'package:ecommerce_app/src/components/cart/api/api_request/cart_api.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

final _apiProvider = Provider((ref) => CartApi());
// @riverpod
// Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) {
//   return ref.read(_apiProvider).getCartList(userId);
// }

@riverpod
Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) async {
  final data = await ref.read(_apiProvider).getCartList(userId);

  return data.map((e) => CartModel.fromDTO(e)).toList();
}

@Riverpod(keepAlive: true)
class CartCounter extends _$CartCounter {
  @override
  int build() => 0;

  inc() => state++;

  dec() => state--;
}
