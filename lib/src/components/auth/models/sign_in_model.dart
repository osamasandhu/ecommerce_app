import 'package:ecommerce_app/src/utils/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_model.g.dart';

part 'sign_in_model.freezed.dart';

@freezed
class SignInModel with _$SignInModel {
  factory SignInModel({
    required String username,
    required String password,
  }) = _SignInModel;

  factory SignInModel.fromJson(Json json) => _$SignInModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson();
}
