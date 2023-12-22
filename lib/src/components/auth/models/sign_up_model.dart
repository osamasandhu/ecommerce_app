import 'package:ecommerce_app/src/utils/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.g.dart';

part 'sign_up_model.freezed.dart';

@freezed
class SignUpModel with _$SignUpModel {
  factory SignUpModel({
    required NameModel name,
    required String email,
    required String password,
    required String username,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Json json) => _$SignUpModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson();
}

@freezed
class NameModel with _$NameModel {
  factory NameModel({
    required String firstname,
    required String lastname,
  }) = _NameModel;

  factory NameModel.fromJson(Json json) => _$NameModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson();
}
