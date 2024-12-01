import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/room_details/domain/repositories/product_repository.dart';

class DeleteProductUsacase extends UseCase<void, int> {
  IProductRepository iProductRepository;
  DeleteProductUsacase(this.iProductRepository);
  @override
  Future<Either<Failure, void>> call(int params) async {
    return await iProductRepository.deleteProduct(params);
  }
}
