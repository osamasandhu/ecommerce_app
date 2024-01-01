import 'package:ecommerce_app/src/features/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/cart/mixing/cart_mixing.dart';

///Local Storage
class AppData with CartProductMixing {

  static late SharedPreferences _preferences;

  Future<void> initilize() async {
    _preferences = await SharedPreferences.getInstance();
    await Hive.initFlutter();

    Hive.registerAdapter(CartModelAdapter());
    await CartProductMixing.initialize();
  }

  static const String accessToken = 'access_Token';

  Future<void> setToken(String token) async {
    await _preferences.setString(accessToken, token);
  }

  String get getToken => _preferences.getString(accessToken) ?? '';

  bool get isSignedIn => getToken.isNotEmpty;

}
