import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/login_response.dart';
import 'package:split_bill/features/login/data/models/register_request_model.dart';
import 'package:split_bill/features/login/data/models/register_response.dart';
import 'package:split_bill/features/login/domain/entity/login_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';

mixin ModelsMapper {
  final RegisterRequestMapper registerRequestMapper = RegisterRequestMapper();
  final RegisterEntityMapper registerEntityMapper = RegisterEntityMapper();
  final LoginRequestMapper loginRequestMapper = LoginRequestMapper();
  final LoginResponseMapper loginResponseMapper = LoginResponseMapper();
}

class RegisterRequestMapper {
  RegisterRequest mapToDataModel(RegisterRequestEntity entity) {
    return RegisterRequest(
      username: entity.username,
      password: entity.password,
      fullName: entity.fullName,
      photoUrl: entity.photoUrl,
    );
  }

  RegisterRequestEntity mapToEntity(RegisterRequest model) {
    return RegisterRequestEntity(
      username: model.username,
      password: model.password,
      fullName: model.fullName,
      photoUrl: model.photoUrl,
    );
  }
}

class RegisterEntityMapper {
  RegisterResponse mapToDataModel(RegisterResponseEntity entity) {
    return RegisterResponse(id: entity.id);
  }

  RegisterResponseEntity mapToEntity(RegisterResponse model) {
    return RegisterResponseEntity(id: model.id);
  }
}

class LoginRequestMapper {
  LoginRequest mapToDataModel(LoginRequestEntity entity) {
    return LoginRequest(
      username: entity.username,
      password: entity.password,
    );
  }

  LoginRequestEntity mapToEntity(LoginRequest model) {
    return LoginRequestEntity(
      username: model.username,
      password: model.password,
    );
  }
}

class LoginResponseMapper {
  LoginResponse mapToDataModel(LoginResponseEntity entity) {
    return LoginResponse(
      id: entity.id,
    );
  }

  LoginResponseEntity mapToEntity(LoginResponse model) {
    return LoginResponseEntity(
      id: model.id!,
    );
  }
}
