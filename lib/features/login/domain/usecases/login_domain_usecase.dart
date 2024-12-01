import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/mapper/login_models_mapper.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/login/data/usecases/login_data_source_usecase.dart';
import 'package:split_bill/features/login/domain/entity/login_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';

class LoginDomainUseCase extends UseCase<LoginResponseEntity, LoginRequestEntity> {
  final requestMapper = LoginRequestMapper();
  final responseMapper = LoginResponseMapper();

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) async {
    final loginDataUseCase = LoginUseCase();
    try {
      final result = await loginDataUseCase(requestMapper.mapToDataModel(params));
      return result.fold(
        (l) => left(l),
        (r) => right(
          responseMapper.mapToEntity(r!),
        ),
      );
    } on TypeError catch (e) {
      return left(const RequiredFieldIsNull());
    } on ServerExeption catch (e) {
      return left(const ServerFailure());
    }
  }
}
