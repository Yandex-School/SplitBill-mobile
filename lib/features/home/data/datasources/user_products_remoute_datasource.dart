import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/core/models/user_products_model.dart';

abstract class UserProductsDatasource {
  Future<List<UserProducsModel>> fetchUserProducts();
}

class UserProductsDatasourceImpl extends UserProductsDatasource {
  @override
  Future<List<UserProducsModel>> fetchUserProducts() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final List<UserProducsModel> mockUserProducts = [
        UserProducsModel(
          id: 1,
          productId: 1,
          status: PaidStatus.paid,
          userId: 1,
        ),
        UserProducsModel(
          id: 2,
          productId: 2,
          status: PaidStatus.paid,
          userId: 2,
        ),
        UserProducsModel(
          id: 3,
          productId: 3,
          status: PaidStatus.unpaid,
          userId: 3,
        ),
        UserProducsModel(
          id: 4,
          productId: 4,
          status: PaidStatus.unpaid,
          userId: 4,
        ),
      ];
      return mockUserProducts;
    } catch (e) {
      throw ServerExeption(message: "Time out");
    }
  }
}
