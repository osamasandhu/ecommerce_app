import 'package:ecommerce_app/src/components/auth/api/dto/name/name_dto.dart';
import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_dto.g.dart';

part 'sign_up_dto.freezed.dart';

@freezed
class SignUpDTO with _$SignUpDTO {
  factory SignUpDTO({
    required NameDTO name,
    required String email,
    required String password,
    required String username,
  }) = _SignUpDTO;

  factory SignUpDTO.fromJson(Json json) => _$SignUpDTOFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson();
}

