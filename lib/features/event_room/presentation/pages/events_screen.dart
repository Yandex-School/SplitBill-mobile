import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/event_room/presentation/widgets/list_item.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import '../widgets/custom_speed_dial.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        centerTitle: true,
        title: const Text(
          "SplitBill",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
              color: theme.iconTheme.color,
            ),
            onPressed: () {
              context.read<ThemeNotifier>().toggleTheme();
            },
          ),
        ],
      ),
      body: Consumer<EventRoomProvider>(
        builder: (context, state, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            itemCount: state.roomsData?.length ?? 0,
            itemBuilder: (context, index) {
              return ListItem(
                roomsData: state.roomsData?[index],
                onTap: () => context.go('/event-rooms/room'),
                onAdd: () {},
                onEdit: () => {},
                onDelete: () => {},
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
