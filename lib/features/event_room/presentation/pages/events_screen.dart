import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/core/theme/app_colors.dart';
import 'package:split_bill/features/event_room/presentation/widgets/list_item.dart';
import 'package:split_bill/features/login/presentation/screen/login_screen.dart';
import '../../domain/controllers/list_controller.dart';
import '../widgets/custom_speed_dial.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SCAFFOLD_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY_COLOR,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        centerTitle: true,
        title: const Text(
          "SplitBill",
          style: TextStyle(
            color: Color(0xff051326),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
                onTap: () => context.go('/event-rooms/room'),
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
