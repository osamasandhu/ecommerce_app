import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin CartProductMixing {
  static Box<CartModel>? _cartBox;

  static Future initialize() async {
    _cartBox = await Hive.openBox('cartBox');
  }

  Future addValueToCart(CartModel cartModel) async {
    await _cartBox!.add(cartModel);
    cartModel.save();
  }

  List<CartModel> getCartProducts() {
    return _cartBox!.values.toList();
  }

  itemDelete(int i) {
    return _cartBox!.deleteAt(i);
  }
}
