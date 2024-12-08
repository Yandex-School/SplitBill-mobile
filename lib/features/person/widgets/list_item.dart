import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int index;

  const ListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Продукт $index',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        'Цена: ${index * 10} руб.',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        onPressed: () {
          // Logic for adding a product
        },
      ),
    );
  }
}
