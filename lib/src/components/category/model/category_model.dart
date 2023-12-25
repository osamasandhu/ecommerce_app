import 'package:ecommerce_app/src/components/category/api/dto/category_model.dart';

class CategoriesModel {
  List<String> categoryName;

  CategoriesModel({required this.categoryName});

  factory CategoriesModel.fromCategoriesDTO(CategoriesDTO dto) {
    return CategoriesModel(categoryName: dto.categoryName);
  }

  CategoriesDTO transform() {
    return CategoriesDTO(categoryName: categoryName);
  }
}
