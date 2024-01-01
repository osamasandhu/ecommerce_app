import 'package:ecommerce_app/src/features/product/api/dto/rating/rating_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.g.dart';

part 'product_dto.freezed.dart';

@freezed
class ProductDTO with _$ProductDTO {
  factory ProductDTO({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
    required RatingDTO rating,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

}
