import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/home/domain/entities/user_products_entity.dart';
import 'package:split_bill/features/home/domain/repository/user_products_rep.dart';

class FetchUserProductsUsacase
    extends UseCase<List<UserProductsEntity>, NoParams> {
  UserProductsRepository userProductsRepository;
  FetchUserProductsUsacase(this.userProductsRepository);

  @override
  Future<Either<Failure, List<UserProductsEntity>>> call(NoParams params) async {
    return await userProductsRepository.fetchUserProducts();
  }
}
