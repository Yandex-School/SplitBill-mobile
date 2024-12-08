import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;

  AddItemDialog({
    required this.nameController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        'Продукт',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Название',
              prefixIcon: Icon(Icons.shopping_cart),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Цена',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFFF00), // Желтый фон
            foregroundColor: Colors.black, // Черный текст
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Закрыть'),
        ),

        
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFFF00),
            foregroundColor: Colors.black, // Черный текст
          ),
          onPressed: () {
            final name = nameController.text;
            final price = priceController.text;

            Navigator.of(context).pop();
          },
          child: Text('Сохранить'),
        ),
      ],
    );
  }
}
