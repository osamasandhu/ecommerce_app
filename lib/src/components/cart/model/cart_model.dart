// ignore_for_file: unnecessary_overrides

import 'package:ecommerce_app/src/utils/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel extends HiveObject with _$CartModel {
  CartModel._();

  @HiveType(typeId: 0, adapterName: 'CartModelAdapter')
  factory CartModel({
    @HiveField(0) int? id,
    @HiveField(1) required int userId,
    @HiveField(2) required DateTime date,
    @HiveField(3) required int productId,
    @HiveField(4) required int quantity,
    @HiveField(5) required String title,
    @HiveField(6) required String image,

  }) = _CartModel;

  factory CartModel.fromJson(Json json) => _$CartModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson();
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
