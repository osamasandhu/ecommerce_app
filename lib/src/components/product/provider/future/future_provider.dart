import 'package:ecommerce_app/src/components/product/api/api_requests/product_api.dart';
import 'package:ecommerce_app/src/components/product/model/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_provider.g.dart';

final _appApiProvider = Provider((ref) => ProductApi());

@riverpod
Future<List<ProductModel>> getProducts(
    GetProductsRef ref, String category) async {
  var product = await ref.read(_appApiProvider).getProducts(category);
  return product.map((e) => ProductModel.fromDTOtoModel(e)).toList();
}

@riverpod
Future<ProductModel> getSingleProduct(GetSingleProductRef ref, int id) async {
  var product = await ref.read(_appApiProvider).getSingleProduct(id);
  return ProductModel.fromDTOtoModel(product);
}

///Old Without DTO
// @riverpod
// Future<List<ProductModel>> getProducts(GetProductsRef ref, String category) {
//   return ref.read(_appApiProvider).getProducts(category);
// }
