import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

part 'category_model.freezed.dart';

@freezed
class CategoriesDTO with _$CategoriesDTO {
  factory CategoriesDTO({
    required List<String> categoryName,
  }) = _CategoriesDTO;

  factory CategoriesDTO.fromJson(Json json) =>
      _$CategoriesDTOFromJson(json);

}
