import 'package:ecommerce_app/src/components/product/api/dto/product/product_dto.dart';
import 'package:ecommerce_app/src/components/product/model/rating_model.dart';

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

  factory ProductModel.fromDto(ProductDTO dto) {
    return ProductModel(
      id: dto.id,
      title: dto.title,
      price: dto.price,
      description: dto.description,
      image: dto.image,
      category: dto.category,
      rating: RatingModel.fromRatingDTO(dto.rating),
    );
  }

  ///Convert Model to DTO
  ProductDTO transform() {
    return ProductDTO(
      id: id,
      title: title,
      price: price,
      description: description,
      image: image,
      category: category,
      rating: rating.transform(),
    );
  }
}
