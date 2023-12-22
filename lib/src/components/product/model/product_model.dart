import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required   String title,
    required double price,
    required  String description,
    required String image,
    required String category,
    required  RatingModel rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@freezed

class RatingModel with _$RatingModel {

 factory RatingModel({
    required int count,
    required double rate,
  })=_RatingModel;

 factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

}
