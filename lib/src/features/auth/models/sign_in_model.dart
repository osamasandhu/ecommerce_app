import 'package:ecommerce_app/src/features/auth/api/dto/sign_in/sign_in_dto.dart';

class SignInModel {
  String username;
  String password;

  SignInModel({required this.username, required this.password});

  factory SignInModel.fromDTOtoModel(SignInDTO dto) {
    return SignInModel(username: dto.username, password: dto.password);
  }

  SignInDTO fromModelToDTO() {
    return SignInDTO(username: username, password: password);
  }
}
