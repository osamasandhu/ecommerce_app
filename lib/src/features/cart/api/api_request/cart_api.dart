import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/cart/api/dto/cart_dto.dart';
import 'package:ecommerce_app/src/features/cart/model/cart_model.dart';
import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api.g.dart';

class _Api {
  static final client = Dio();
}

@RestApi()
abstract class CartApi {
  factory CartApi() => _CartApi(_Api.client, baseUrl: kApiUrl);

  ///Add Data to cart
  @POST('carts')
  Future<CartDTO> addCartProduct(@Body() CartModel cartModel);

  ///Get Data to cart
  @GET('carts/user/{userId}')
  Future<List<CartDTO>> getCartList(@Path('userId') int userId);
}
