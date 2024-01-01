import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_dto.g.dart';

part 'rating_dto.freezed.dart';

@freezed
class RatingDTO with _$RatingDTO {
  factory RatingDTO({
    required int count,
    required double rate,
  }) = _RatingDTO;

  factory RatingDTO.fromJson(Map<String, dynamic> json) =>
      _$RatingDTOFromJson(json);

}
