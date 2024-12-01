import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, bool>> createProduct(ProductEntity product);
  Future<Either<Failure, bool>> createProducts(List<ProductEntity> product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(int id);
}
