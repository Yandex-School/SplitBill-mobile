import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/home/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> fetchAllUsers();
}
