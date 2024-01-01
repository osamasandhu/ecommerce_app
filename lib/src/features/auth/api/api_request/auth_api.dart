import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/auth/api/dto/sign_in/sign_in_dto.dart';
import 'package:ecommerce_app/src/features/auth/api/dto/sign_up/sign_up_dto.dart';
import 'package:ecommerce_app/src/helpers/const.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

class _Api {
  static final client = Dio();
}

@RestApi()
abstract class AuthApi {
  factory AuthApi() => _AuthApi(_Api.client, baseUrl: kApiUrl);

  @POST('users')
  Future signUp(@Body() SignUpDTO signUpModel);

  @POST('auth/login')
  Future<String> signIn(@Body() SignInDTO signInModel);
}
