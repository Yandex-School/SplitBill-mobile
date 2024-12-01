import 'package:split_bill/core/mapper/models_mapper.dart';
import 'package:split_bill/features/login/data/models/register_request_model.dart';
import 'package:split_bill/features/login/data/models/register_response.dart';
import 'package:split_bill/features/login/domain/entity/register_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';

class RegisterRequestMapper
    extends UiEntityToDataModelMapper<RegisterRequestEntity, RegisterRequest> {
  @override
  RegisterRequest mapToDataModel(RegisterRequestEntity entity) {
    return RegisterRequest(
      username: entity.username,
      password: entity.password,
      fullName: entity.fullName,
      photoUrl: entity.photoUrl,
    );
  }

  @override
  RegisterRequestEntity mapToEntity(RegisterRequest model) {
    return RegisterRequestEntity(
      username: model.username,
      password: model.password,
      fullName: model.fullName,
      photoUrl: model.photoUrl,
    );
  }
}

class RegisterEntityMapper
    extends UiEntityToDataModelMapper<RegisterResponseEntity, RegisterResponse> {
  @override
  RegisterResponse mapToDataModel(RegisterResponseEntity entity) {
    return RegisterResponse(id: entity.id);
  }

  @override
  RegisterResponseEntity mapToEntity(RegisterResponse model) {
    return RegisterResponseEntity(id: model.id);
  }
}
