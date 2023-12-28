import 'package:ecommerce_app/src/components/auth/api/dto/sign_in/sign_in_dto.dart';

class SignInModel {
  String username;
  String password;

  SignInModel({required this.username, required this.password});

  factory SignInModel.fromDto(SignInDTO dto) {
    return SignInModel(username: dto.username, password: dto.password);
  }

  SignInDTO toDTO() {
    return SignInDTO(username: username, password: password);
  }
}
// part 'sign_in_model.g.dart';
//
// part 'sign_in_model.freezed.dart';
//
// @freezed
// class SignInModel with _$SignInModel {
//   factory SignInModel({
//     required String username,
//     required String password,
//   }) = _SignInModel;
//
//   factory SignInModel.fromJson(Json json) => _$SignInModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => super.toJson();
// }
