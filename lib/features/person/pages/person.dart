import 'dart:math';
import 'package:flutter/material.dart';
import 'package:split_bill/core/theme/app_diemens.dart';
import '../widgets/list_item.dart';

class Profile1 extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const Profile1({super.key, required this.onToggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int randomizeImage() => Random().nextInt(6);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.BORDER_RADIUS_40),
              ),
            ),
            pinned: true,
            backgroundColor: theme.primaryColor,
            floating: true,
            title: const Text(
              'Профиль',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: theme.primaryColor.withOpacity(0.2),
                      foregroundImage: AssetImage('assets/png/person-${randomizeImage()}.png'),
                      radius: 50.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '098765432',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add payment logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Оплатить',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListItem(index: index); // Widget for each item
                  },
                ),
              );
            },
          );
        },
        backgroundColor: theme.primaryColor,
        child: const Icon(
          Icons.add_shopping_cart,
          color: Colors.black,
        ),
      ),
    );
  }
}
