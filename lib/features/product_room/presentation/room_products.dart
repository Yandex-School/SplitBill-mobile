import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/product_room/presentation/provider/room_products_provider.dart';

class RoomProductsScreen extends StatefulWidget {
  final String? roomId;

  const RoomProductsScreen({
    super.key,
    this.roomId,
  });

  @override
  _RoomProductsScreenState createState() => _RoomProductsScreenState();
}

class _RoomProductsScreenState extends State<RoomProductsScreen> with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);

    // _tabController.addListener(() {
    //   setState(() {}); // Обновление состояния при переключении вкладок
    // });
  }

  @override
  void dispose() {
    // _tabController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listProvider = context.watch<RoomProductsProvider>();

    return PopScope(
      canPop: listProvider.products.isEmpty,
      onPopInvokedWithResult: (canPop, result) {
        if (!canPop) {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('Есть не сохраненные изменения. Вы уверены, что хотите выйти?'),
              actions: [
                TextButton(
                  onPressed: () {
                    dialogContext.pop(false);
                  },
                  child: const Text('Нет'),
                ),
                ElevatedButton(
                  onPressed: () {
                    listProvider.clearProducts();
                    dialogContext.pop(true);
                    context.pop(true);
                  },
                  child: const Text('Да'),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: const Text(
            'Чек комнаты',
            style: TextStyle(color: Colors.black),
          ),
          // bottom: TabBar(
          //   controller: _tabController,
          //   indicatorColor: Colors.black,
          //   indicatorSize: TabBarIndicatorSize.tab,
          //   tabs: [
          //     const Tab(
          //       icon: Icon(Icons.list, color: Colors.black),
          //       text: "По позициям",
          //     ),
          //     const Tab(
          //       icon: Icon(Icons.attach_money, color: Colors.black),
          //       text: "Общая сумма",
          //     ),
          //   ],
          // ),
          actions: [
            IconButton(
              onPressed: () {
                // save products to backend
              },
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Builder(
          builder: (context) {
            if (listProvider.isLoadingProducts) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (listProvider.products.isEmpty) {
              return const Center(
                child: Text(
                  'Список пуст',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }

            return ListView.builder(
              itemCount: listProvider.products.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final product = listProvider.products[index];
                return ListTile(
                  onTap: () {
                    _nameController.text = product.name;
                    _priceController.text = product.price.toString();
                    _showDialog(context, replacementIndex: index);
                  },
                  contentPadding: EdgeInsets.zero,
                  title: Text(product.name),
                  subtitle: Text(product.price.toString()),
                  trailing: IconButton(
                    onPressed: () => listProvider.removeProduct(product),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton:
            // _tabController.index == 0
            //     ?
            FloatingActionButton(
          backgroundColor: Colors.yellow[700],
          onPressed: () {
            _showDialog(context);
          },
          child: const Icon(Icons.add, color: Colors.black),
        ),
        // : null,
      ),
    );
  }

  // Widget _buildPriceTab() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const Text(
  //             'Введите общую сумму',
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //           const SizedBox(height: 16),
  //           TextField(
  //             controller: _priceController,
  //             inputFormatters: [
  //               FilteringTextInputFormatter.digitsOnly,
  //             ],
  //             decoration: InputDecoration(
  //               labelText: 'Сумма',
  //               prefixIcon: const Icon(Icons.attach_money),
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //             ),
  //             keyboardType: TextInputType.number,
  //           ),
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () {
  //               final price = _priceController.text;
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(content: Text('Price "$price" saved!')),
  //               );
  //             },
  //             style: ElevatedButton.styleFrom(
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8.0),
  //               ),
  //               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  //             ),
  //             child: const Text(
  //               'Сохранить',
  //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _showDialog(BuildContext context, {int? replacementIndex}) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text(
            'Добавить продукт',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.sizeOf(ctx).width * 0.75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Название',
                    prefixIcon: const Icon(Icons.shopping_cart),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _priceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'Цена',
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => ctx.pop(),
              child: const Text('Закрыть'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final price = _priceController.text;
                context.read<RoomProductsProvider>().addProduct(
                      name: name,
                      price: int.parse(price),
                      replacementIndex: replacementIndex,
                    );
                _nameController.clear();
                _priceController.clear();
                ctx.pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}
