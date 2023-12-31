import 'package:ecommerce_app/src/features/auth/api/dto/sign_up/sign_up_dto.dart';
import 'package:ecommerce_app/src/features/auth/models/name_model.dart';

class SignUpModel {
  NameModel name;
  String email;
  String password;
  String username;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.name,
  });

  factory SignUpModel.fromDTOtoModel(SignUpDTO dto) {
    return SignUpModel(
      username: dto.username,
      email: dto.email,
      password: dto.password,
      // name: NameModel.fromNameDTO(dto.name),

      name: NameModel.fromDTOtoModel(dto.name),
    );
  }

  SignUpDTO fromModelToDTO() {
    return SignUpDTO(
        // name: name.transform(),

        name: name.fromModelToDTO(),
        email: email,
        password: password,
        username: username);
  }
}

// @freezed
// class SignUpModel with _$SignUpModel {
//   factory SignUpModel({
//     required NameModel name,
//     required String email,
//     required String password,
//     required String username,
//   }) = _SignUpModel;
//
//   factory SignUpModel.fromJson(Json json) => _$SignUpModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => super.toJson();
// }
//
// @freezed
// class NameModel with _$NameModel {
//   factory NameModel({
//     required String firstname,
//     required String lastname,
//   }) = _NameModel;
//
//   factory NameModel.fromJson(Json json) => _$NameModelFromJson(json);
//
//   @override
//   Map<String, dynamic> toJson() => super.toJson();
// }




















// Convert DTO to MOdel


