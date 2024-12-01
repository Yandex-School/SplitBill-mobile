import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';
import 'package:split_bill/features/room_details/domain/repositories/product_repository.dart';

class CreateProductUsecase extends UseCase<bool, ProductEntity> {
  IProductRepository iProductRepository;
  CreateProductUsecase(this.iProductRepository);
  @override
  Future<Either<Failure, bool>> call(ProductEntity params) async {
    return await iProductRepository.createProduct(params);
  }
}
