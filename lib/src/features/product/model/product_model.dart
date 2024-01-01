
import 'package:ecommerce_app/src/features/product/api/dto/product/product_dto.dart';
import 'package:ecommerce_app/src/features/product/model/rating_model.dart';

class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String image;
  String category;
  RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  ///Convert DTO to Model

  factory ProductModel.fromDTOtoModel(ProductDTO dto) {
    return ProductModel(
      id: dto.id,
      title: dto.title,
      price: dto.price,
      description: dto.description,
      image: dto.image,
      category: dto.category,
      rating: RatingModel.fromDTOtoModel(dto.rating),
    );
  }

  ///Convert Model to DTO
  ProductDTO fromModelToDTO() {
    return ProductDTO(
      id: id,
      title: title,
      price: price,
      description: description,
      image: image,
      category: category,
      rating: rating.fromModelToDTO(),
    );
  }
}
