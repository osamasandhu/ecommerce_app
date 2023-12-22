import 'package:ecommerce_app/src/utils/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

part 'category_model.freezed.dart';

@freezed
class CategoriesModel with _$CategoriesModel {
  factory CategoriesModel({
    required List<String> categoryName,
  }) = _CategoriesModel;

  factory CategoriesModel.fromJson(Json json) =>
      _$CategoriesModelFromJson(json);
}
