import 'package:ecommerce_app/app_data.dart';
import 'package:ecommerce_app/src/features/cart/api/api_request/cart_api.dart';
import 'package:ecommerce_app/src/features/cart/model/cart_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

final _apiProvider = Provider((ref) => CartApi());

@riverpod
Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) async {
  final cartItems = await ref.read(_apiProvider).getCartList(userId);

  return cartItems.map((e) => CartModel.fromDTOtoModel(e)).toList();
}

@Riverpod(keepAlive: true)
class CartCounter extends _$CartCounter {
  @override

  int build() => AppData().getCartProducts().length;

  inc() => state++;

  dec() => state--;
}
