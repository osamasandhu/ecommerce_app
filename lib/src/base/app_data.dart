import 'package:ecommerce_app/src/components/cart/mixing/cart_mixing.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Local Storage
class AppData with CartProductMixing {
  // static late Box _user;

  static late SharedPreferences _preferences;

  Future<void> initilize() async {
    _preferences = await SharedPreferences.getInstance();
    await Hive.initFlutter();

    Hive.registerAdapter(CartModelAdapter());
    // Hive.registerAdapter(CartProductsModelAdapter());

    // _user = await Hive.openBox('userBox');
    // print(accessToken);
    await CartProductMixing.initialize();
  }

  static const String accessToken = 'access_Token';

  Future<void> setToken(String token) async {
    await _preferences.setString(accessToken, token);
  }

  String get getToken => _preferences.getString(accessToken) ?? '';

  bool get isSignedIn => getToken.isNotEmpty;

}

///Access Token Using Hive
//  String token = 'access_token';

// Future setToken(String value) async {
//   return await _user.put(token, value);
// }
//
// getToken() => _user.get(token);
//
// bool get isLoggedIn {
//   if (getToken() == null) {
//     return true;
//   } else {
//     return false;
//   }
// }
