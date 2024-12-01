import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room_details/data/darasources/product_datasources.dart';
import 'package:split_bill/features/room_details/data/models/product_model.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';
import 'package:split_bill/features/room_details/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  IProductDatasources productDatasources;
  ProductRepositoryImpl({required this.productDatasources});

  @override
  Future<Either<Failure, bool>> createProduct(ProductEntity product) async {
    try {
      final result = await productDatasources.createProduct(
        product.toModel(),
      );
      return Right(result);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createProducts(
      List<ProductEntity> products) async {
    try {
      final result = await productDatasources
          .createProducts(products.map((e) => e.toModel()).toList());
      return Right(result);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      final result = await productDatasources.deleteProduct(id);
      return Right(result);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct(
      ProductEntity product) async {
    try {
      final mapper = ProductMapper();
      final result = await productDatasources.updateProduct(product.toModel());
      return Right(mapper.mapperToEntity(result));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
