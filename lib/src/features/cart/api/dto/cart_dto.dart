// ignore_for_file: unnecessary_overrides

import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_dto.g.dart';

part 'cart_dto.freezed.dart';

@Freezed(toJson: false)
class CartDTO with _$CartDTO {
  factory CartDTO({
    int? id,
    required int userId,
    required DateTime date,
    required int productId,
    required int quantity,
    required String title,
    required String image,
  }) = _CartDTO;

  factory CartDTO.fromJson(Json json) => _$CartDTOFromJson(json);

  // CartModel transform() {
  //   return CartModel(
  //       userId: userId,
  //       date: date,
  //       productId: productId,
  //       quantity: quantity,
  //       title: title,
  //       image: image);
  // }
}

// @freezed
// class CartModel extends HiveObject with _$CartModel {
//   CartModel._();
//
//   @HiveType(typeId: 0, adapterName: 'CartModelAdapter')
//   factory CartModel({
//     @HiveField(0) int? id,
//     @HiveField(1) required int userId,
//     @HiveField(2) required DateTime date,
//     @HiveField(3) required List<CartProductsModel> products,
//   }) = _CartModel;
//
//   factory CartModel.fromJson(Json json) => _$CartModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => super.toJson();
// }
//
// @freezed
// class CartProductsModel extends HiveObject with _$CartProductsModel {
//   CartProductsModel._();
//
//   @HiveType(typeId: 1, adapterName: 'CartProductsModelAdapter')
//   factory CartProductsModel({
//     @HiveField(0) required int productId,
//     @HiveField(1) required int quantity,
//   }) = _CartProductsModel;
//
//   factory CartProductsModel.fromJson(Json json) =>
//       _$CartProductsModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => super.toJson();
// }
