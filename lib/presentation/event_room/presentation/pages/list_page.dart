import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/presentation/event_room/presentation/widgets/list_item.dart';
import 'package:split_bill/presentation/login_page/pages/login_page.dart';
import '../../domain/controllers/list_controller.dart';
import '../widgets/custom_speed_dial.dart'; 


class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SplitBill",
          style: TextStyle(
            color:Color(0xff051326),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color(0xff051326),
            ),
            onPressed: () {
              // Переход на страницу логина
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
        backgroundColor:  Colors.yellow, // Фиолетовый цвет
        centerTitle: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Consumer<ListController>(
        builder: (context, controller, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              return ListItem(
                record: item,
                onAdd: () => controller.addItem(item),
                onEdit: () => controller.editItem(item),
                onDelete: () => controller.deleteItem(item),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          );
        },
      ),
      floatingActionButton: const CustomSpeedDial(), 
    );
  }
}
