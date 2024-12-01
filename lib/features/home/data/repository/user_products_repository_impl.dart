import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/models/user_products_model.dart';
import 'package:split_bill/features/home/data/datasources/user_products_remoute_datasource.dart';
import 'package:split_bill/features/home/domain/entities/user_products_entity.dart';
import 'package:split_bill/features/home/domain/repository/user_products_rep.dart';

class UserProductsRepositoryImpl extends UserProductsRepository {
  UserProductsDatasource userProductsDatasource;
  UserProductsRepositoryImpl({required this.userProductsDatasource});
  @override
  Future<Either<Failure, List<UserProductsEntity>>> fetchUserProducts() async {
    try {
      final result = await userProductsDatasource.fetchUserProducts();
      final product = result
          .map(
            (model) => UserProductsEntity(
              id: model.id ?? 0,
              status: model.status ?? PaidStatus.initial,
              productId: model.productId ?? 0,
              userId: model.userId ?? 0,
            ),
          )
          .toList();

      return Right(product);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
