import 'package:flutter/material.dart';
import '../../domain/entities/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor =
        theme.brightness == Brightness.light ? Colors.black : Colors.black;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: theme.cardColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.primaryColor,
          child: Text(
            '${item.id}',
            style: TextStyle(
              color: iconColor, 
            ),
          ),
        ),
        title: Text(
          item.name,
          style: theme.textTheme.bodyLarge,
        ),
        subtitle: Text(
          'Price: \$${item.price}',
          style: theme.textTheme.bodyMedium,
        ),
        onTap: onTap,
      ),
    );
  }
}
