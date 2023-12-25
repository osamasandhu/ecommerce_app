import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/components/product/api/dto/product/product_dto.dart';
import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api.g.dart';

class _Api {
  static final client = Dio();
}

@RestApi()
abstract class ProductApi {
  factory ProductApi() => _ProductApi(_Api.client, baseUrl: kApiUrl);

  @GET('products/category/{name}')
  Future<List<ProductDTO>> getProducts(@Path('name') String name);
}
