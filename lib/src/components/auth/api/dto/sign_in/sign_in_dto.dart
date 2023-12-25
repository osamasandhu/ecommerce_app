import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_dto.g.dart';

part 'sign_in_dto.freezed.dart';

@freezed
class SignInDTO with _$SignInDTO {
  factory SignInDTO({
    required String username,
    required String password,
  }) = _SignInDTO;

  factory SignInDTO.fromJson(Json json) => _$SignInDTOFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => super.toJson();
}
