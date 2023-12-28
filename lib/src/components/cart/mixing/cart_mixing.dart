import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin CartProductMixing {
  ///Locally Stores the data of cart
  static Box<CartModel>? _cartBox;

  static Future initialize() async {
    _cartBox = await Hive.openBox('cartBox');
  }

  ///Add Data to cart locally
  Future addValueToCart(CartModel cartModel) async {
    await _cartBox!.add(cartModel);
    cartModel.save();
  }

  ///Add Data from cart locally
  List<CartModel> getCartProducts() {
    return _cartBox!.values.toList();
  }

  ///Delete Data from cart locally
  itemDelete(int i) {
    return _cartBox!.deleteAt(i);
  }
}
