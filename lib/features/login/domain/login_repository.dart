import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/mapper/models_mapper.dart';
import 'package:split_bill/features/login/data/auth_datasource.dart';
import 'package:split_bill/features/login/data/login_data_source.dart';
import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/register_request_model.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';

class LoginRepositoryImpl with ModelsMapper implements AuthorizationRepository {
  final AuthorizationApi authApi;

  LoginRepositoryImpl({required this.authApi});

  @override
  Future<Either<Failure, RegisterResponseEntity?>> register({
    required String username,
    required String password,
    required String fullName,
    String? photoUrl,
  }) async {
    try {
      final result = await authApi.register(
        registerRequest: RegisterRequest(
          username: username,
          password: password,
          fullName: fullName,
          photoUrl: photoUrl ?? '',
        ),
      );
      if (result == null) {
        return const Left(ServerFailure());
      }

      return Right(registerEntityMapper.mapToEntity(result));
    } on ServerFailure catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponseEntity?>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await authApi.login(
        loginRequest: LoginRequest(
          username: username,
          password: password,
        ),
      );
      if (result == null) {
        return const Left(ServerFailure());
      }
      return Right(loginResponseMapper.mapToEntity(result));
    } on ServerFailure catch (e) {
      print(e);
      return const Left(ServerFailure());
    } on Object catch (e) {
      print(e);
      return const Left(ServerFailure());
    }
  }
}
