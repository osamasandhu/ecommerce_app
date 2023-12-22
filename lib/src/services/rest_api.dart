import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/components/auth/models/sign_in_model.dart';
import 'package:ecommerce_app/src/components/auth/models/sign_up_model.dart';
import 'package:ecommerce_app/src/components/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/components/product/model/product_model.dart';
import 'package:ecommerce_app/src/utils/const.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

class _Api {
  static final client = Dio();
}

@RestApi()
abstract class AppApi {
  factory AppApi() => _AppApi(_Api.client, baseUrl: kApiUrl);

  @POST('users')
  Future signUp(@Body() SignUpModel signUpModel);

  @POST('auth/login')
  Future<String> signIn(@Body() SignInModel signInModel);

  @GET('products/categories')
  Future<List<String>> getCategories();

  @GET('products/category/{name}')
  Future<List<ProductModel>> getProducts(@Path('name') String name);

  @POST('carts')
  Future<CartModel> addCartProduct(@Body() CartModel cartModel);

  @GET('carts/user/{userId}')
  Future<List<CartModel>> getCartList(@Path('userId') int userId);
}
