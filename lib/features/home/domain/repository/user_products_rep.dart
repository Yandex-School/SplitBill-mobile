import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/home/domain/entities/user_products_entity.dart';

abstract class UserProductsRepository {
  Future<Either<Failure, List<UserProductsEntity>>> fetchUserProducts();
}
