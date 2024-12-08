import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
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
      setState(() {}); // Обновление состояния при переключении вкладок
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
        backgroundColor: Colors.yellow[700],
        title: Text(
          'Stylish Tabs',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.list, color: Colors.black),
              text: "Add",
            ),
            Tab(
              icon: Icon(Icons.attach_money, color: Colors.black),
              text: "Price",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListTab(),
          _buildPriceTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              backgroundColor: Colors.yellow[700],
              onPressed: () {
                _showDialog(context);
              },
              child: Icon(Icons.add, color: Colors.black),
            )
          : null,
    );
  }

  Widget _buildListTab() {
    return Center(
      child: Text(
        'List Page Content',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPriceTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
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
                'Enter Price',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final price = _priceController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Price "$price" saved!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text(
            'Add Item',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.shopping_cart),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Закрыть диалог
              },
              style: TextButton.styleFrom(
               
              ),
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final price = _priceController.text;
              
                Navigator.of(context).pop(); // Закрыть диалог
              },
              style: ElevatedButton.styleFrom(
        
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(home: TabPage()));
}
