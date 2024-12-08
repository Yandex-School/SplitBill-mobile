import 'package:flutter/material.dart';
import '../../data/models/example_record.dart';

class ListItem extends StatelessWidget {
  final ExampleRecord record;
  final VoidCallback onAdd;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Function()? onTap;

  const ListItem({
    super.key,
    required this.record,
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
              record.title,
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "Участники: ${record.weight}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            // trailing: IconButton(
            //   icon: const Icon(Icons.exit_to_app),
            //   color: Colors.red, 
            //   onPressed: onDelete,
            //   tooltip: "Удалить",
            // ),
          ),
        ),
      ),
    );
  }
}
