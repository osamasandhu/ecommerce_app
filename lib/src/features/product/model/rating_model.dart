
import 'package:ecommerce_app/src/features/product/api/dto/rating/rating_dto.dart';

class RatingModel {
  int count;
  double rate;

  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromDTOtoModel(RatingDTO dto) {
    return RatingModel(count: dto.count, rate: dto.rate);
  }

  RatingDTO fromModelToDTO() {
    return RatingDTO(count: count, rate: rate);
  }
}
