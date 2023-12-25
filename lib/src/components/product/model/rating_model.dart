import 'package:ecommerce_app/src/components/product/api/dto/rating/rating_dto.dart';

class RatingModel {
  int count;
  double rate;

  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromRatingDTO(RatingDTO dto) {
    return RatingModel(count: dto.count, rate: dto.rate);
  }

  RatingDTO transform() {
    return RatingDTO(count: count, rate: rate);
  }
}
