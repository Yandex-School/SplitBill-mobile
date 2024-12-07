import 'dart:async';
import 'package:split_bill/features/event_room/data/models/example_record.dart';

class MockRepository {
  final List<ExampleRecord> _store = List.generate(
    10,
    (index) => ExampleRecord(
      id: index + 1,
      title: 'Элемент ${index + 1}',
      weight: (index + 1) * 10,
    ),
  );

  Future<List<ExampleRecord>> fetchItems() async {
    await Future.delayed(const Duration(milliseconds: 500)); 
    return _store;
  }

  void addItem(ExampleRecord item) {
    _store.add(item);
  }

  void updateItem(ExampleRecord updatedItem) {
    final index = _store.indexWhere((item) => item.id == updatedItem.id);
    if (index != -1) _store[index] = updatedItem;
  }

  void deleteItem(int id) {
    _store.removeWhere((item) => item.id == id);
  }
}

