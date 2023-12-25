import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_dto.g.dart';

part 'name_dto.freezed.dart';

@freezed
class NameDTO with _$NameDTO {
  factory NameDTO({
    required String firstname,
    required String lastname,
  }) = _NameDTO;

  factory NameDTO.fromJson(Json json) => _$NameDTOFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => super.toJson();
}
