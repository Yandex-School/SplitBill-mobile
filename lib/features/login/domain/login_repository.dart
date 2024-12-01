import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/login/domain/entity/login_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_request_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';
import 'package:split_bill/features/login/domain/usecases/login_domain_usecase.dart';
import 'package:split_bill/features/login/domain/usecases/register_domain_use_case.dart';

abstract interface class AuthorizationRepository {
  Future<Either<Failure, LoginResponseEntity>> login({
    required String username,
    required String password,
  });
  Future<Either<Failure, RegisterResponseEntity>> register({
    required String username,
    required String password,
    required String fullName,
    String? photoUrl,
  });
}

class LoginRepositoryImpl implements AuthorizationRepository {
  final LoginDomainUseCase loginUseCase = LoginDomainUseCase();
  final RegisterDomainUseCase registerUseCase = RegisterDomainUseCase();
  @override
  Future<Either<Failure, LoginResponseEntity>> login({
    required String username,
    required String password,
  }) {
    return loginUseCase(LoginRequestEntity(username: username, password: password));
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> register({
    required String username,
    required String password,
    required String fullName,
    String? photoUrl,
  }) {
    return registerUseCase(RegisterRequestEntity(
      username: username,
      password: password,
      fullName: fullName,
      photoUrl: photoUrl,
    ));
  }
}
