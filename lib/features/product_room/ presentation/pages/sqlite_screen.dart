import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import 'package:split_bill/features/product_room/data/repositories/item_repository_impl.dart';
import 'package:split_bill/features/product_room/domain/entities/item.dart';
import 'package:split_bill/features/product_room/domain/usecases/add_item.dart';
import 'package:split_bill/features/product_room/domain/usecases/delete_item.dart';
import 'package:split_bill/features/product_room/domain/usecases/get_items.dart';
import 'package:split_bill/features/product_room/domain/usecases/update_item.dart';
import 'package:split_bill/features/product_room/utils/daatbase_helper.dart';

import '../widgets/action_button.dart';
import '../widgets/input_field.dart';
import '../widgets/item_card.dart';

class SQLiteScreen extends StatefulWidget {
  const SQLiteScreen({Key? key}) : super(key: key);

  @override
  _SQLiteScreenState createState() => _SQLiteScreenState();
}

class _SQLiteScreenState extends State<SQLiteScreen> {
  late AddItem addItemUseCase;
  late DeleteItem deleteItemUseCase;
  late GetItems getItemsUseCase;
  late UpdateItem updateItemUseCase;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<Item> _items = [];
  int? _selectedId;

  @override
  void initState() {
    super.initState();
    final dbHelper = DatabaseHelper();
    final repository = ItemRepositoryImpl(dbHelper);
    addItemUseCase = AddItem(repository);
    deleteItemUseCase = DeleteItem(repository);
    getItemsUseCase = GetItems(repository);
    updateItemUseCase = UpdateItem(repository);

    _loadItems();
  }

  void _loadItems() async {
    final items = await getItemsUseCase();
    setState(() {
      _items = items;
    });
  }

  void _addItem() async {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text);

    if (name.isNotEmpty && price != null) {
      await addItemUseCase(Item(name: name, price: price));
      _loadItems();
      _clearFields();
    } else {
      _showToast('Please enter a valid name and price');
    }
  }

  void _updateItem() async {
    if (_selectedId != null) {
      final name = _nameController.text;
      final price = double.tryParse(_priceController.text);

      if (name.isNotEmpty && price != null) {
        await updateItemUseCase(Item(id: _selectedId, name: name, price: price));
        _loadItems();
        _clearFields();
      } else {
        _showToast('Please enter a valid name and price');
      }
    } else {
      _showToast('Please select an item to update');
    }
  }

  void _deleteItem() async {
    if (_selectedId != null) {
      await deleteItemUseCase(_selectedId!);
      _loadItems();
      _clearFields();
    } else {
      _showToast('Please select an item to delete');
    }
  }

  void _clearFields() {
    _nameController.clear();
    _priceController.clear();
    _selectedId = null;
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField(
              controller: _nameController,
              label: 'Name',
              icon: Icons.production_quantity_limits,
            ),
            const SizedBox(height: 12.0),
            InputField(
              controller: _priceController,
              label: 'Price',
              icon: Icons.monetization_on,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  text: 'Add',
                  color: const Color(0xffe7ff73),
                  onPressed: _addItem,
                ),
                ActionButton(
                  text: 'Update',
                  color: const Color(0xffe7ff73),
                  onPressed: _updateItem,
                ),
                ActionButton(
                  text: 'Delete',
                  color: const Color(0xffe7ff73),
                  onPressed: _deleteItem,
                ),
                ActionButton(
                  text: 'Cancel',
                  color: const Color(0xffe7ff73),
                  onPressed: _clearFields,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ItemCard(
                    item: item,
                    onTap: () {
                      setState(() {
                        _selectedId = item.id;
                        _nameController.text = item.name;
                        _priceController.text = item.price.toString();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
