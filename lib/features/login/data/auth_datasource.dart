import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/login_response.dart';
import 'package:split_bill/features/login/data/models/register_request_model.dart';
import 'package:split_bill/features/login/data/models/register_response.dart';

part 'auth_datasource.g.dart';

@RestApi(baseUrl: 'https://split-bill.steamfest.live')
abstract class AuthorizationApi {
  factory AuthorizationApi(Dio dio, {String baseUrl}) = _AuthorizationApi;

  @POST('/login')
  Future<LoginResponse?> login({
    @Body() required LoginRequest loginRequest,
  });

  @POST('/register')
  Future<RegisterResponse?> register({
    @Body() required RegisterRequest registerRequest,
  });
}
