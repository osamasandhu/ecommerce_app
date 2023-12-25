import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api.g.dart';

class _Api {
  static final client = Dio();
}

@RestApi()
abstract class CategoryApi {
  factory CategoryApi() => _CategoryApi(_Api.client, baseUrl: kApiUrl);

  @GET('products/categories')
  Future<List<String>> getCategories();
}
