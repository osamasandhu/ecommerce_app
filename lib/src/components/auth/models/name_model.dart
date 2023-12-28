import 'package:ecommerce_app/src/components/auth/api/dto/name/name_dto.dart';

class NameModel {
  String firstname;
  String lastname;

  NameModel({
    required this.lastname,
    required this.firstname,
  });

  factory NameModel.fromDTOtoModel(NameDTO dto) {
    return NameModel(
      lastname: dto.lastname,
      firstname: dto.firstname,
    );
  }

  NameDTO fromModelToDTO() {
    return NameDTO(
      firstname: firstname,
      lastname: lastname,
    );
  }
}
