import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_entity.freezed.dart';

@freezed
class RegisterResponseEntity with _$RegisterResponseEntity {
  const factory RegisterResponseEntity({
    required int id,
  }) = _RegisterResponseEntity;
}
