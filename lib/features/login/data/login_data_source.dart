import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/login/domain/entity/login_response_entity.dart';
import 'package:split_bill/features/login/domain/entity/register_response_entity.dart';

abstract interface class AuthorizationRepository {
  Future<Either<Failure, LoginResponseEntity?>> login({
    required String username,
    required String password,
  });

  Future<Either<Failure, RegisterResponseEntity?>> register({
    required String username,
    required String password,
    required String fullName,
    String? photoUrl,
  });
}
