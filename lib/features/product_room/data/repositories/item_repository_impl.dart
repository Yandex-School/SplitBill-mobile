import 'package:split_bill/features/product_room/utils/daatbase_helper.dart';


import '../../domain/entities/item.dart';
import '../../domain/repositories/item_repository.dart';


class ItemRepositoryImpl implements ItemRepository {
  final DatabaseHelper dbHelper;

  ItemRepositoryImpl(this.dbHelper);

  @override
  Future<List<Item>> getItems() async {
    final data = await dbHelper.getItems();
    return data.map((e) => Item(id: e['id'], name: e['name'], price: e['price'])).toList();
  }

  @override
  Future<void> addItem(Item item) async {
    await dbHelper.insertItem(item.name, item.price);
  }

  @override
  Future<void> updateItem(Item item) async {
    if (item.id != null) {
      await dbHelper.updateItem(item.id!, item.name, item.price);
    }
  }

  @override
  Future<void> deleteItem(int id) async {
    await dbHelper.deleteItem(id);
  }
}
