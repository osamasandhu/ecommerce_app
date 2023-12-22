import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_provider.g.dart';

@riverpod
class CounterValue extends _$CounterValue {
  @override
  int build() => 1;

  increment() => state++;

  decrement() => state--;
}

@Riverpod(keepAlive: true)
class CartCounter extends _$CartCounter {
  @override
  int build() => 0;

  inc() => state++;

  dec() => state--;
}

// @Riverpod(keepAlive: true)
// class Cart extends _$Cart {
//   Future<CartModel> build() async {
//     // data = api-call
//
//     Future<List<CartModel>> getCartItems(GetCartItemsRef ref, int userId) {
//       return ref.read(appApiProvider).getCartList(userId);
//     }
//
//
//     // clear hive box
//     // insert data in hive box
//
//     // return data
//   }
//
//   addItem() {
//     // Hive.add()
//     state = Hive.get();
//   }
//
//   removeItem() {
//   //    Hive.remove()
//
//     state = Hive.get();
//   }
// }
//
// // API
// // Local storage
