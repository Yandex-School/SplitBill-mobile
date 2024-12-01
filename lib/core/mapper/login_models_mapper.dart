import 'package:split_bill/core/mapper/models_mapper.dart';
import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/login_response.dart';
import 'package:split_bill/features/login/domain/entity/login_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';

class LoginRequestMapper extends UiEntityToDataModelMapper<LoginRequestEntity, LoginRequest> {
  @override
  LoginRequest mapToDataModel(LoginRequestEntity entity) {
    return LoginRequest(
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  LoginRequestEntity mapToEntity(LoginRequest model) {
    return LoginRequestEntity(
      username: model.username,
      password: model.password,
    );
  }
}

class LoginResponseMapper extends UiEntityToDataModelMapper<LoginResponseEntity, LoginResponse> {
  @override
  LoginResponse mapToDataModel(LoginResponseEntity entity) {
    return LoginResponse(
      id: entity.id,
    );
  }

  @override
  LoginResponseEntity mapToEntity(LoginResponse model) {
    return LoginResponseEntity(
      id: model.id!,
    );
  }
}
