import 'package:flutter/material.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';

class ListItem extends StatelessWidget {
  final CreatedRoomsResponseItemsEntity? roomsData;
  final VoidCallback onAdd;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Function()? onTap;

  const ListItem({
    super.key,
    this.roomsData,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            title: Text(
              roomsData?.name ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              "Участники",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: onDelete,
              tooltip: "Удалить",
            ),
          ),
        ),
      ),
    );
  }
}
