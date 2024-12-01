import 'package:flutter/material.dart';
import '../../data/models/example_record.dart';

class ListItem extends StatelessWidget {
  final ExampleRecord record;
  final VoidCallback onAdd;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ListItem({
    Key? key,
    required this.record,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff051326) 
            ),
          ),
          subtitle: Text(
            "Участники: ${record.weight}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.orange),
                onPressed: onDelete,
                tooltip: "Удалить",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
