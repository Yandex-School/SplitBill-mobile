import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, bool>> crerateProduct(ProductEntity product);
  Future<Either<Failure, bool>> crerateProducts(List<ProductEntity> product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(int id);
}
