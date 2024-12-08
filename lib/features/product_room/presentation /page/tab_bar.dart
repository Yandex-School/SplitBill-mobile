import 'package:flutter/material.dart';
import '../widgets/list_tab_widget.dart';
import '../widgets/price_tab_widget.dart';
import '../widgets/add_item_dialog.dart';

class TabPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  TabPage({required this.onThemeToggle, required this.isDarkMode});

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
          
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          tabs: [
            Tab(
              icon: Icon(Icons.add_chart, color: Colors.black),
              child: Text(
                "Список",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              icon: Icon(Icons.attach_money, color: Colors.black),
              child: Text(
                "Цена",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListTabWidget(),
          PriceTabWidget(priceController: _priceController),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddItemDialog(
                    nameController: _nameController,
                    priceController: _priceController,
                  ),
                );
              },
              child: Icon(Icons.add, color: Colors.black),
            )
          : null,
    );
  }
}
