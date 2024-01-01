
import 'package:ecommerce_app/src/features/category/api/dto/category_model.dart';

class CategoriesModel {
  List<String> categoryName;

  CategoriesModel({required this.categoryName});

  factory CategoriesModel.fromDTOtoModel(CategoriesDTO dto) {
    return CategoriesModel(categoryName: dto.categoryName);
  }

  CategoriesDTO fromModelToDTO() {
    return CategoriesDTO(categoryName: categoryName);
  }
}
