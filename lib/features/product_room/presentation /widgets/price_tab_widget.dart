import 'package:flutter/material.dart';

class PriceTabWidget extends StatelessWidget {
  final TextEditingController priceController;

  PriceTabWidget({required this.priceController});

  @override
  Widget build(BuildContext context) {
    // Динамический цвет для фона карточки
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff051326) // Темный синий для темной темы
        : const Color(0xFFFFFFFF); // Белый для светлой темы

    // Цвет текста в зависимости от темы
    final textColor = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: cardColor, // Динамический фон карточки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Общий счет',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Меняется в зависимости от темы
                ),
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  final price = priceController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Цена "$price" сохранена!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFF00), // Желтый фон
                  foregroundColor: Colors.black, // Черный текст
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  'Сохранить',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
