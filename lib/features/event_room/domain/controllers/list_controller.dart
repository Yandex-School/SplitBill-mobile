import 'package:flutter/material.dart';
import '../../data/models/example_record.dart';
import '../../data/repositories/mock_repository.dart';

class ListController extends ChangeNotifier {
  final MockRepository repository;

  List<ExampleRecord> _items = [];
  List<ExampleRecord> get items => _items;

  ListController(this.repository) {
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await repository.fetchItems();
    notifyListeners();
  }

  void addNewItem() {
    final newItem = ExampleRecord(
      id: _items.length + 1,
      title: 'Новый элемент ${_items.length + 1}',
      weight: _items.isNotEmpty ? _items.last.weight + 10 : 10,
    );
    repository.addItem(newItem);
    _items.add(newItem);
    notifyListeners();
  }

  void addItem(ExampleRecord item) {
    final newItem = item.copyWith(weight: item.weight + 1);
    repository.updateItem(newItem);
    _loadItems();
  }

  void editItem(ExampleRecord item) {
    final updatedItem = item.copyWith(title: '${item.title} (редактировано)');
    repository.updateItem(updatedItem);
    _loadItems();
  }

  void deleteItem(ExampleRecord item) {
    repository.deleteItem(item.id);
    _loadItems();
  }
}
