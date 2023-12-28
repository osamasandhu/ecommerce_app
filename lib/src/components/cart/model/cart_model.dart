import 'package:ecommerce_app/src/components/cart/api/dto/cart_dto.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

// @freezed
@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final int productId;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final String title;
  @HiveField(6)
  final String image;

  CartModel({
    this.id,
    required this.userId,
    required this.date,
    required this.productId,
    required this.quantity,
    required this.title,
    required this.image,
  });

  /// Converting DTO to model
  factory CartModel.fromDTOtoModel(CartDTO dto) {
    return CartModel(
      userId: dto.userId,
      date: dto.date,
      productId: dto.productId,
      quantity: dto.quantity,
      title: dto.title,
      image: dto.image,
    );
  }

  /// Converting model to DTO
  CartDTO fromModelToDTO() {
    return CartDTO(
      userId: userId,
      date: date,
      productId: productId,
      quantity: quantity,
      title: title,
      image: image,
    );
  }
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
