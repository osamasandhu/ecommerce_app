import 'package:ecommerce_app/src/components/auth/api/dto/name/name_dto.dart';

class NameModel {
  String firstname;
  String lastname;

  NameModel({
    required this.lastname,
    required this.firstname,
  });

  factory NameModel.fromNameDTO(NameDTO dto) {
    return NameModel(
      lastname: dto.lastname,
      firstname: dto.firstname,
    );
  }

  NameDTO transform() {
    return NameDTO(
      firstname: firstname,
      lastname: lastname,
    );
  }
}
