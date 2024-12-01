import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';
import 'package:split_bill/features/room_details/domain/repositories/product_repository.dart';

class UpdateProductUsecase extends UseCase<ProductEntity, ProductEntity> {
  IProductRepository iProductRepository;
  UpdateProductUsecase(this.iProductRepository);
  @override
  Future<Either<Failure, ProductEntity>> call(ProductEntity params) async {
    return await iProductRepository.updateProduct(params);
  }
}
