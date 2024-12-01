import 'package:split_bill/features/room_details/data/models/product_model.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';

abstract class UiEntityToDataModelMapper<Entity, Model> {
  Model mapToDataModel(Entity entity);
  Entity mapToEntity(Model model);
}

class ProductModelsMapper extends UiEntityToDataModelMapper<ProductEntity, ProductModel> {
  @override
  ProductModel mapToDataModel(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      roomId: entity.roomId,
    );
  }

  @override
  ProductEntity mapToEntity(ProductModel model) {
    return ProductEntity(
      id: model.id!,
      name: model.name!,
      price: model.price,
      roomId: model.roomId!,
    );
  }
}
