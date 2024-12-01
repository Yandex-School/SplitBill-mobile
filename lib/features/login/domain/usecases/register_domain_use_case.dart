import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/mapper/register_models_mapper.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/login/data/usecases/register_use_case.dart';
import 'package:split_bill/features/login/domain/entity/register_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';

class RegisterDomainUseCase extends UseCase<RegisterResponseEntity, RegisterRequestEntity> {
  final responseDataMapper = RegisterEntityMapper();
  final requestDataMapper = RegisterRequestMapper();
  final registerDataUseCase = RegisterUseCase();

  @override
  Future<Either<Failure, RegisterResponseEntity>> call(RegisterRequestEntity params) async {
    final result = await registerDataUseCase(requestDataMapper.mapToDataModel(params));
    return result.fold(
      (l) => left(l),
      (r) => right(responseDataMapper.mapToEntity(r!)),
    );
  }
}
